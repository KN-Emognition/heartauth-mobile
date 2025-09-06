import 'package:openapi_client/openapi_client.dart';

Future<ChallengeCompleteRequest> buildChallengeCompleteRequest(
    String challenge, String signature) async {
  return ChallengeCompleteRequest((b) => b
    ..challenge = challenge
    ..signature = signature);
}