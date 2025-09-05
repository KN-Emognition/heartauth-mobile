import 'package:test/test.dart';
import 'package:openapi_client/openapi_client.dart';

/// tests for ChallengeApi
void main() {
  final instance = OpenapiClient().getChallengeApi();

  group(ChallengeApi, () {
    // Complete a challenge from the device after ECG pass and signature verification.
    //
    // Mobile app posts a signed assertion proving possession of the device key. Server validates signature (using stored public key), nonce, and policy.
    //
    //Future<StatusResponse> externalChallengeComplete(String id, ChallengeCompleteRequest challengeCompleteRequest) async
    test('test externalChallengeComplete', () async {
      // TODO
    });
  });
}
