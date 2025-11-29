import 'package:test/test.dart';
import 'package:heartauth_mobile/heartauth_mobile.dart';

/// tests for WellKnownApi
void main() {
  final instance = HeartauthMobile().getWellKnownApi();

  group(WellKnownApi, () {
    // Get JSON Web Key Set (JWKS)
    //
    //Future<JwkSet> getWellKnown() async
    test('test getWellKnown', () async {
      // TODO
    });
  });
}
