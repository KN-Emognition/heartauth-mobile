import 'package:openapi_client/openapi_client.dart';
import 'package:pointycastle/export.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hauth_mobile/utils/encryption.dart';

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

Future<(PairingConfirmRequest, Map<String, dynamic>)> buildConfirmPairingRequest(
    PairingInitResponse initResponse
) async {
  final storage = await SharedPreferences.getInstance();

  final signature = await signNonce(initResponse.nonce);

  return (
    PairingConfirmRequest(
      (b) => b
        ..deviceId = storage.getString("deviceId")
        ..signature = signature
        ..alg = EncryptionAlgo.eS256
    ),
    {"Authorization": "Bearer ${storage.getString("tempJwt")}"},
  );
}
