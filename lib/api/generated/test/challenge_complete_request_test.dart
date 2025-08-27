import 'package:test/test.dart';
import 'package:openapi_client/openapi_client.dart';

// tests for ChallengeCompleteRequest
void main() {
  final instance = ChallengeCompleteRequestBuilder();
  // TODO add properties to the builder and call build()

  group(ChallengeCompleteRequest, () {
    // JWS (ES256) signed by the device key. Claims: challengeId, nonce, aud, iat, biometricPassed, matchScore, deviceId.
    // String assertionJwt
    test('to test the property `assertionJwt`', () async {
      // TODO
    });

    // String anything
    test('to test the property `anything`', () async {
      // TODO
    });
  });
}
