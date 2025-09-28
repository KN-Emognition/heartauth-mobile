import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:jose/jose.dart' show JsonWebSignatureBuilder, JsonWebKey;
import 'package:pointycastle/api.dart';
import 'package:pointycastle/ecc/api.dart';
import 'package:pointycastle/key_generators/api.dart';
import 'package:pointycastle/key_generators/ec_key_generator.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:pointycastle/block/aes_fast.dart';
import 'package:pointycastle/block/modes/gcm.dart';
import 'package:pointycastle/digests/sha256.dart';

Uint8List _i2osp(int v, int len) {
  final b = ByteData(len);
  if (len == 4)
    b.setUint32(0, v, Endian.big);
  else {
    for (int i = len - 1, x = v; i >= 0; i--, x >>= 8) {
      b.setUint8(i, x & 0xff);
    }
  }
  return b.buffer.asUint8List();
}

Uint8List _bigIntToFixed(BigInt v, int len) {
  final out = Uint8List(len);
  var x = v;
  for (var i = len - 1; i >= 0; i--) {
    out[i] = (x & BigInt.from(0xff)).toInt();
    x = x >> 8;
  }
  return out;
}

String _b64u(Uint8List d) => base64Url.encode(d).replaceAll('=', '');

Uint8List _utf8(String s) => Uint8List.fromList(utf8.encode(s));

Map<String, dynamic> _ecPublicJwk(ECPublicKey pub) {
  final bits = pub.parameters!.curve.fieldSize;
  final size = (bits + 7) ~/ 8;
  final x = _bigIntToFixed(pub.Q!.x!.toBigInteger()!, size);
  final y = _bigIntToFixed(pub.Q!.y!.toBigInteger()!, size);
  final crv = switch (bits) {
    256 => 'P-256',
    384 => 'P-384',
    521 => 'P-521',
    _ => throw UnsupportedError('curve'),
  };
  return {'kty': 'EC', 'crv': crv, 'x': _b64u(x), 'y': _b64u(y)};
}

JsonWebKey _ecPrivateToJwk(ECPrivateKey priv, {String? kid}) {
  final bits = priv.parameters!.curve.fieldSize;
  final size = (bits + 7) ~/ 8;
  final pub = priv.parameters!.G * priv.d!;
  final x = _bigIntToFixed(pub!.x!.toBigInteger()!, size);
  final y = _bigIntToFixed(pub.y!.toBigInteger()!, size);
  final d = _bigIntToFixed(priv.d!, size);
  final crv = switch (bits) {
    256 => 'P-256',
    384 => 'P-384',
    521 => 'P-521',
    _ => throw UnsupportedError('curve'),
  };
  return JsonWebKey.fromJson({
    'kty': 'EC',
    'crv': crv,
    'x': _b64u(x),
    'y': _b64u(y),
    'd': _b64u(d),
    if (kid != null) 'kid': kid,
  });
}

// RFC 7518 §4.6.2 Concat KDF (SHA-256)
Uint8List _concatKdfSha256(
  Uint8List Z,
  String encName,
  int keyBits, {
  Uint8List? apu,
  Uint8List? apv,
}) {
  apu ??= Uint8List(0);
  apv ??= Uint8List(0);

  Uint8List algId(String s) =>
      Uint8List.fromList(_i2osp(s.length, 4) + _utf8(s));
  Uint8List lenPref(Uint8List x) => Uint8List.fromList(_i2osp(x.length, 4) + x);

  final reps = (keyBits / 256).ceil(); // SHA-256 output = 256 bits
  final out = BytesBuilder();
  for (var counter = 1; counter <= reps; counter++) {
    final otherInfo = Uint8List.fromList(
      algId(encName) + lenPref(apu) + lenPref(apv) + _i2osp(keyBits, 4),
    );
    final data = Uint8List.fromList(_i2osp(counter, 4) + Z + otherInfo);

    final sha = SHA256Digest()..reset();
    sha.update(data, 0, data.length);
    final block = Uint8List(sha.digestSize);
    sha.doFinal(block, 0);
    out.add(block);
  }
  final okm = out.toBytes();
  return okm.sublist(0, keyBits ~/ 8);
}

// AES-GCM encrypt with AAD=protected header (base64url string)
({Uint8List ct, Uint8List tag}) _aesGcmEncrypt(
  Uint8List key,
  Uint8List iv,
  String protectedB64,
  Uint8List pt,
) {
  final gcm = GCMBlockCipher(AESFastEngine());
  final aad = _utf8(protectedB64);
  gcm.init(true, AEADParameters(KeyParameter(key), 128, iv, aad));
  final out = gcm.process(pt);
  // last 16 bytes are tag
  final tagLen = 16;
  return (
    ct: out.sublist(0, out.length - tagLen),
    tag: out.sublist(out.length - tagLen),
  );
}

// ========== main API

/// Produces a compact JWE: alg=ECDH-ES, enc=A256GCM that wraps a compact JWS (ES256).
/// Java side: `new ECDHDecrypter(recipientPrivateKey)` then verify inner JWS.
Future<String> signThenEncryptECDHES({
  required Map<String, dynamic> payload,
  required ECPrivateKey senderPrivateKey, // for JWS ES256
  required ECPublicKey recipientPublicKey, // for ECDH-ES
  String curveName = 'prime256v1', // P-256
  Uint8List? apu, // optional PartyUInfo (bytes)
  Uint8List? apv, // optional PartyVInfo (bytes)
}) async {
  // 1) Sign payload as JWS (ES256)
  final senderJwk = _ecPrivateToJwk(senderPrivateKey, kid: 'sender-key');
  final jwsBuilder = JsonWebSignatureBuilder()
    ..jsonContent = payload
    ..setProtectedHeader('alg', 'ES256')
    ..setProtectedHeader('typ', 'JWT')
    ..setProtectedHeader('kid', senderJwk.keyId)
    ..addRecipient(senderJwk);
  final jwsCompact = jwsBuilder.build().toCompactSerialization();

  // 2) Generate ephemeral EC key (same curve)
  final ecParams = ECDomainParameters(curveName);
  final gen = ECKeyGenerator()
    ..init(
      ParametersWithRandom(
        ECKeyGeneratorParameters(ecParams),
        (FortunaRandom()..seed(
          KeyParameter(
            // replace with real CSPRNG seed in prod
            Uint8List.fromList(List<int>.generate(32, (i) => (i * 37) & 0xff)),
          ),
        )),
      ),
    );
  final eph = gen.generateKeyPair();
  final epkPriv = eph.privateKey;
  final epkPub = eph.publicKey;

  // 3) ECDH shared secret Z = (recipientPublicKey.Q * epkPriv.d).x
  final P = (recipientPublicKey.Q! * epkPriv.d!)!;
  final z = _bigIntToFixed(
    P.x!.toBigInteger()!,
    (ecParams.curve.fieldSize + 7) ~/ 8,
  );

  // 4) ConcatKDF -> CEK for A256GCM (256 bits)
  final cek = _concatKdfSha256(z, 'A256GCM', 256, apu: apu, apv: apv);

  // 5) Protected header with alg=ECDH-ES, enc=A256GCM, epk (+ optional apu/apv)
  final header = <String, dynamic>{
    'alg': 'ECDH-ES',
    'enc': 'A256GCM',
    'epk': _ecPublicJwk(epkPub),
    if (apu != null && apu.isNotEmpty) 'apu': _b64u(apu),
    if (apv != null && apv.isNotEmpty) 'apv': _b64u(apv),
  };
  final protectedB64 = _b64u(
    Uint8List.fromList(utf8.encode(jsonEncode(header))),
  );

  // 6) AES-GCM encrypt the inner JWS. IV 12 bytes, tag 16 bytes
  final iv = Uint8List.fromList(
    List<int>.generate(12, (_) => Random.secure().nextInt(256)),
  );
  final pt = _utf8(jwsCompact);
  final enc = _aesGcmEncrypt(cek, iv, protectedB64, pt);

  // 7) Build compact JWE: protected . encryptedKey . iv . ciphertext . tag
  // For ECDH-ES (direct key agreement), the "encryptedKey" part is empty.
  final compactJwe = [
    protectedB64,
    '', // empty
    _b64u(iv),
    _b64u(enc.ct),
    _b64u(enc.tag),
  ].join('.');

  return compactJwe;
}
