import 'dart:convert';
import 'dart:typed_data';
import 'package:heartauth_mobile/heartauth_mobile.dart';
import 'package:pointycastle/export.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hauth_mobile/utils/ecrypt.dart';

AsymmetricKeyPair<PublicKey, PrivateKey> generateKeyPair() {
  final ecDomain = ECDomainParameters('prime256v1'); // P-256 curve
  final keyGen = ECKeyGenerator()
    ..init(
      ParametersWithRandom(
        ECKeyGeneratorParameters(ecDomain),
        SecureRandom('Fortuna')..seed(
          KeyParameter(
            Uint8List.fromList(List.generate(32, (i) => i * 37 % 256)),
          ),
        ),
      ),
    );
  return keyGen.generateKeyPair();
}

String publicKeyToPem(ECPublicKey publicKey) {
  return CryptoUtils.encodeEcPublicKeyToPem(publicKey);
}

String privateKeyToPem(ECPrivateKey privateKey) {
  return CryptoUtils.encodeEcPrivateKeyToPem(privateKey);
}

Future<ECPrivateKey?> loadPrivateKey() async {
  final pem = await FlutterSecureStorage().read(key: "privateKeyPem");
  if (pem == null) return null;
  return CryptoUtils.ecPrivateKeyFromPem(pem);
}

Future<String?> signNonce(String nonce) async {
  final privateKey = await loadPrivateKey();
  if (privateKey == null) {
    throw Exception("No private key stored");
  }

  // Convert nonce to bytes
  final messageBytes = utf8.encode(nonce);

  // Initialize signer
  final signer = Signer('SHA-256/DET-ECDSA');
  signer.init(true, PrivateKeyParameter<ECPrivateKey>(privateKey));

  // Sign
  final ECSignature sig =
      signer.generateSignature(Uint8List.fromList(messageBytes)) as ECSignature;

  // ES256 requires r and s concatenated as fixed 32-byte big-endian integers
  final rBytes = _bigIntToFixedLengthBytes(sig.r, 32);
  final sBytes = _bigIntToFixedLengthBytes(sig.s, 32);

  final rawSignature = Uint8List.fromList([...rBytes, ...sBytes]);

  // Return base64url-encoded signature (standard for ES256/JWT)
  return base64UrlEncode(rawSignature).replaceAll('=', '');
}

Uint8List _bigIntToFixedLengthBytes(BigInt number, int length) {
  final bytes = number
      .toUnsigned(8 * length)
      .toRadixString(16)
      .padLeft(length * 2, '0');
  return Uint8List.fromList(
    List<int>.generate(
      length,
      (i) => int.parse(bytes.substring(i * 2, i * 2 + 2), radix: 16),
    ),
  );
}

Map<String, dynamic> _pairsListToMap(Object serialized) {
  final list = serialized as List<Object?>;
  final m = <String, dynamic>{};
  for (var i = 0; i < list.length; i += 2) {
    m[list[i] as String] = list[i + 1];
  }
  return m;
}

BigInt _bytesToInt(Uint8List b) {
  var result = BigInt.zero;
  for (final byte in b) {
    result = (result << 8) | BigInt.from(byte);
  }
  return result;
}

Uint8List _leftPadTo(Uint8List src, int length) {
  if (src.length == length) return src;
  if (src.length > length) {
    // Some decoders can drop leading zero; keep the least-significant bytes
    return Uint8List.fromList(src.sublist(src.length - length));
  }
  final out = Uint8List(length);
  out.setRange(length - src.length, length, src);
  return out;
}

Future<String> createDataToken(
  ECPublicKey pubKey, {
  List<double>? testEcg,
  List<List<double>>? refEcg,
}) async {
  if (testEcg == null && refEcg == null) {
    throw ArgumentError('At least one of testEcg or refEcg must be provided.');
  }

  final privateKey = await loadPrivateKey();

  final payload = <String, dynamic>{};
  if (testEcg != null) payload['testEcg'] = testEcg;
  if (refEcg != null) payload['refEcg'] = refEcg;

  return signThenEncryptECDHES(
    payload: payload,
    recipientPublicKey: pubKey,
    senderPrivateKey: privateKey!,
  );
}

ECPublicKey ecPublicKeyFromJwkSet(JwkSet set) {
  final serialized = serializers.serializeWith(ECJwk.serializer, set.keys[0])!;
  final jwkMap = serialized is Map<String, dynamic>
      ? serialized
      : _pairsListToMap(serialized);
  return ecPublicKeyFromJwk(jwkMap);
}

ECPublicKey ecPublicKeyFromJwk(Map<String, dynamic> jwk) {
  final kty = jwk['kty'] as String?;
  final crv = jwk['crv'] as String?;
  if (kty != 'EC' || crv == null) {
    throw ArgumentError('Expected EC JWK with crv.');
  }

  // Map JOSE curve name to PointyCastle domain
  late final ECDomainParameters domain;
  switch (crv) {
    case 'P-256':
    case 'prime256v1':
    case 'secp256r1':
      domain = ECDomainParameters('secp256r1'); // == P-256
      break;
    default:
      throw ArgumentError('Unsupported EC curve: $crv');
  }

  final xB = _leftPadTo(_b64uDecode(jwk['x'] as String), 32);
  final yB = _leftPadTo(_b64uDecode(jwk['y'] as String), 32);

  final x = _bytesToInt(xB);
  final y = _bytesToInt(yB);

  final q = domain.curve.createPoint(x, y);
  return ECPublicKey(q, domain);
}

Uint8List _b64uDecode(String s) {
  final pad = '=' * ((4 - s.length % 4) % 4);
  return base64Url.decode(s + pad);
}

String _b64u(Uint8List bytes) {
  return base64Url.encode(bytes).replaceAll('=', '');
}
