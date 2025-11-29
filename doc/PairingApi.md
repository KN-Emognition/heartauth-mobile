# heartauth_mobile.api.PairingApi

## Load the API package
```dart
import 'package:heartauth_mobile/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completePairing**](PairingApi.md#completepairing) | **POST** /mobile/v1/pairing/complete | Confirm device pairing by proving possession of the generated private key.
[**initPairing**](PairingApi.md#initpairing) | **POST** /mobile/v1/pairing/init | Begin device pairing using a one-time pairing JWT from Keycloak.


# **completePairing**
> completePairing(completePairingRequest)

Confirm device pairing by proving possession of the generated private key.

Device signs the server-provided nonce (and context) with its hardware-backed private key. On success, orchestrator persists device metadata and marks `jti` as linked. 

### Example
```dart
import 'package:heartauth_mobile/api.dart';

final api = HeartauthMobile().getPairingApi();
final CompletePairingRequest completePairingRequest = ; // CompletePairingRequest | 

try {
    api.completePairing(completePairingRequest);
} catch on DioException (e) {
    print('Exception when calling PairingApi->completePairing: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **completePairingRequest** | [**CompletePairingRequest**](CompletePairingRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **initPairing**
> InitPairingResponse initPairing(initPairingRequest)

Begin device pairing using a one-time pairing JWT from Keycloak.

Mobile app calls this after scanning the QR on the Keycloak Required Action page. Returns a fresh nonce and creates pairing state keyed by JWT `jti`. 

### Example
```dart
import 'package:heartauth_mobile/api.dart';

final api = HeartauthMobile().getPairingApi();
final InitPairingRequest initPairingRequest = ; // InitPairingRequest | 

try {
    final response = api.initPairing(initPairingRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PairingApi->initPairing: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **initPairingRequest** | [**InitPairingRequest**](InitPairingRequest.md)|  | 

### Return type

[**InitPairingResponse**](InitPairingResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

