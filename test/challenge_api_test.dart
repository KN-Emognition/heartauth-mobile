import 'package:test/test.dart';
import 'package:heartauth_mobile/heartauth_mobile.dart';

/// tests for ChallengeApi
void main() {
  final instance = HeartauthMobile().getChallengeApi();

  group(ChallengeApi, () {
    // Complete a challenge from the device after ECG pass and signature verification.
    //
    // Mobile app posts a signed assertion proving possession of the device key. Server validates signature (using stored public key), nonce, and policy.
    //
    //Future completeChallenge(String id, CompleteChallengeRequest completeChallengeRequest) async
    test('test completeChallenge', () async {
      // TODO
    });
  });
}
