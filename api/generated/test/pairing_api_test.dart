import 'package:test/test.dart';
import 'package:openapi_client/openapi_client.dart';

/// tests for PairingApi
void main() {
  final instance = OpenapiClient().getPairingApi();

  group(PairingApi, () {
    // Confirm device pairing by proving possession of the generated private key.
    //
    // Device signs the server-provided nonce (and context) with its hardware-backed private key. On success, orchestrator persists device metadata and marks `jti` as linked.
    //
    //Future<StatusResponse> externalPairingConfirm(PairingConfirmRequest pairingConfirmRequest) async
    test('test externalPairingConfirm', () async {
      // TODO
    });

    // Begin device pairing using a one-time pairing JWT from Keycloak.
    //
    // Mobile app calls this after scanning the QR on the Keycloak Required Action page. Returns a fresh nonce and creates pairing state keyed by JWT `jti`.
    //
    //Future<PairingInitResponse> externalPairingInit(PairingInitRequest pairingInitRequest) async
    test('test externalPairingInit', () async {
      // TODO
    });
  });
}
