import 'package:test/test.dart';
import 'package:openapi_client/openapi_client.dart';

// tests for PairingConfirmRequest
void main() {
  final instance = PairingConfirmRequestBuilder();
  // TODO add properties to the builder and call build()

  group(PairingConfirmRequest, () {
    // String jti
    test('to test the property `jti`', () async {
      // TODO
    });

    // String deviceId
    test('to test the property `deviceId`', () async {
      // TODO
    });

    // Base64url DER ECDSA over SHA-256(nonce||jti||deviceId).
    // String signature
    test('to test the property `signature`', () async {
      // TODO
    });

    // String alg
    test('to test the property `alg`', () async {
      // TODO
    });

    // String dpop
    test('to test the property `dpop`', () async {
      // TODO
    });
  });
}
