import 'package:basic_utils/basic_utils.dart';
import 'package:hauth_api_external/hauth_api_external.dart';
import 'package:hauth_mobile/utils/ecrypt.dart';
import 'package:hauth_mobile/utils/encryption.dart';

Future<ChallengeCompleteRequest> buildChallengeCompleteRequest(
  List<double> rawEcg,
  String ephemeralPublicKeyPem,
  String nonce,
) async {
  final signedNonce = await signNonce(nonce);

  final tokenData = await createDataToken(
    CryptoUtils.ecPublicKeyFromPem(ephemeralPublicKeyPem),
    testEcg: rawEcg,
  );

  return ChallengeCompleteRequest(
    (b) => b
      ..dataToken = tokenData
      ..signature = signedNonce,
  );
}
