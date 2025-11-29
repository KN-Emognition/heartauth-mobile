import 'package:basic_utils/basic_utils.dart';
import 'package:heartauth_mobile/heartauth_mobile.dart';
import 'package:hauth_mobile/utils/encryption.dart';

Future<CompleteChallengeRequest> buildChallengeCompleteRequest(
  List<double> rawEcg,
  String ephemeralPublicKeyPem,
  String nonce,
) async {
  final signedNonce = await signNonce(nonce);

  final tokenData = await createDataToken(
    CryptoUtils.ecPublicKeyFromPem(ephemeralPublicKeyPem),
    testEcg: rawEcg,
  );

  return CompleteChallengeRequest(
    (b) => b
      ..dataToken = tokenData
      ..signature = signedNonce,
  );
}
