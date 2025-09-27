import 'dart:convert';
import 'dart:typed_data';

import 'package:basic_utils/basic_utils.dart';
import 'package:hauth_api_external/hauth_api_external.dart';
import 'package:pointycastle/export.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hauth_mobile/utils/encryption.dart';

import '../aes/ecrypt.dart';

Future<(PairingInitRequest, Map<String, dynamic>)> buildInitPairingRequest(
  String jwtToken,
) async {
  // Generate key pair
  final keyPair = generateKeyPair();
  final publicKeyPem = publicKeyToPem(keyPair.publicKey as ECPublicKey);
  final privateKeyPem = privateKeyToPem(keyPair.privateKey as ECPrivateKey);

  final secureStorage = FlutterSecureStorage();
  await secureStorage.write(key: 'privateKeyPem', value: privateKeyPem);
  await secureStorage.write(key: 'publicKeyPem', value: publicKeyPem);

  final storage = await SharedPreferences.getInstance();
  await storage.setString("tempJwt", jwtToken);

  // Play Integrity token
  // final attestationToken = await getIntegrityToken();
  final attestationToken = "MEETS_DEVICE_INTEGRITY";

  final attestationBuilder = AttestationBuilder();
  attestationBuilder.type = AttestationTypeEnum.playIntegrity;
  attestationBuilder.verdict = attestationToken;

  return (
    PairingInitRequest(
      (b) => b
        ..deviceId = storage.getString("deviceId")
        ..displayName = storage.getString("displayName")
        ..publicKeyPem = publicKeyPem
        ..fcmToken = storage.getString('fcmToken')
        ..platform = Platform.ANDROID
        ..osVersion = storage.getString("osVersion")
        ..model = storage.getString("model")
        ..attestation = attestationBuilder,
    ),
    {"Authorization": "Bearer $jwtToken"},
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


Future<(PairingConfirmRequest, Map<String, dynamic>)>
buildConfirmPairingRequest(
  PairingInitResponse initResponse,
  List<double> rawEcg,
  JwkSet set,
) async {
  final storage = await SharedPreferences.getInstance();
  final serialized = serializers.serializeWith(ECJwk.serializer, set.keys[0])!;
  final jwkMap = serialized is Map<String, dynamic>
      ? serialized
      : _pairsListToMap(serialized);
  final recipientPublicKey = ecPublicKeyFromJwk(jwkMap);

  final privateKey = await loadPrivateKey();
  final tokenData = await signThenEncryptECDHES(
    payload: {
      'data': "Hello from the other side",
      'refEcg': rawEcg,
      'testEcg': rawEcg,
    },
    recipientPublicKey: recipientPublicKey,
    senderPrivateKey: privateKey!,
  );

  final signature = await signNonce(initResponse.nonce);

  return (
    PairingConfirmRequest(
      (b) => b
        ..deviceId = storage.getString("deviceId")
        ..dataToken = tokenData
        ..signature = signature
        ..alg = EncryptionAlgo.eS256,
    ),
    {"Authorization": "Bearer ${storage.getString("tempJwt")}"},
  );
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

// ---------- BigInt / bytes helpers ----------
Uint8List _bigIntToFixed(BigInt i, int length) {
  // big-endian, zero-left-padded
  final bytes = <int>[];
  var x = i;
  while (x > BigInt.zero) {
    bytes.add((x & BigInt.from(0xff)).toInt());
    x = x >> 8;
  }
  final b = Uint8List(length);
  final start = length - bytes.length;
  for (var j = 0; j < bytes.length; j++) {
    b[start + j] = bytes[bytes.length - 1 - j];
  }
  return b;
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
