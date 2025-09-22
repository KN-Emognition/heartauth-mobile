import 'package:hauth_api_external/hauth_api_external.dart';

Future<ChallengeCompleteRequest> buildChallengeCompleteRequest() async {
  return ChallengeCompleteRequest(
    (b) => b
      ..anything = 'PLACEHOLDER' //TODO: replace with actual data
      ..assertionJwt = 'PLACEHOLDER', //TODO: replace with actual data
  );
}
