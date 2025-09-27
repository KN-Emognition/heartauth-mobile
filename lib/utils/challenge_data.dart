import 'package:basic_utils/basic_utils.dart';
import 'package:hauth_api_external/hauth_api_external.dart';
import '../aes/ecrypt.dart';
import 'encryption.dart';

Future<ChallengeCompleteRequest> buildChallengeCompleteRequest(
  List<double> rawEcg,
  String ephemeralPublicKeyPem,
  String nonce,
) async {
  final signedNonce = await signNonce(nonce);
  final privateKey = await loadPrivateKey();
  final tokenData = await signThenEncryptECDHES(
    payload: {
      'data': "Hello from the other side",
      'refEcg': rawEcg,
      'testEcg': rawEcg,
    },
    recipientPublicKey: CryptoUtils.ecPublicKeyFromPem(ephemeralPublicKeyPem),
    senderPrivateKey: privateKey!,
  );
  return ChallengeCompleteRequest(
    (b) => b
      ..dataToken = tokenData
      ..signature = signedNonce,
  );
}
