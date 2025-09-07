import 'package:openapi_client/openapi_client.dart';

Future<ChallengeCompleteRequest> buildChallengeCompleteRequest() async {
  return ChallengeCompleteRequest(
    (b) => b
      ..anything = 'PLACEHOLDER' //TODO: replace with actual data
      ..assertionJwt = 'PLACEHOLDER', //TODO: replace with actual data
  );
}
