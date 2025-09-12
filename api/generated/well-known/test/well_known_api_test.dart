import 'package:test/test.dart';
import 'package:openapi_client/openapi_client.dart';

/// tests for WellKnownApi
void main() {
  final instance = OpenapiClient().getWellKnownApi();

  group(WellKnownApi, () {
    // Get JSON Web Key Set (JWKS)
    //
    //Future<JwkSet> getJwks() async
    test('test getJwks', () async {
      // TODO
    });
  });
}
