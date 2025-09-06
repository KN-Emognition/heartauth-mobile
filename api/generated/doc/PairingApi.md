# openapi_client.api.PairingApi

## Load the API package
```dart
import 'package:openapi_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**externalPairingConfirm**](PairingApi.md#externalpairingconfirm) | **POST** /external/v1/pair/exchange/confirm | Confirm device pairing by proving possession of the generated private key.
[**externalPairingInit**](PairingApi.md#externalpairinginit) | **POST** /external/v1/pair/exchange/init | Begin device pairing using a one-time pairing JWT from Keycloak.


# **externalPairingConfirm**
> externalPairingConfirm(pairingConfirmRequest)

Confirm device pairing by proving possession of the generated private key.

Device signs the server-provided nonce (and context) with its hardware-backed private key. On success, orchestrator persists device metadata and marks `jti` as linked. 

### Example
```dart
import 'package:openapi_client/api.dart';

final api = OpenapiClient().getPairingApi();
final PairingConfirmRequest pairingConfirmRequest = ; // PairingConfirmRequest | 

try {
    api.externalPairingConfirm(pairingConfirmRequest);
} catch on DioException (e) {
    print('Exception when calling PairingApi->externalPairingConfirm: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pairingConfirmRequest** | [**PairingConfirmRequest**](PairingConfirmRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **externalPairingInit**
> PairingInitResponse externalPairingInit(pairingInitRequest)

Begin device pairing using a one-time pairing JWT from Keycloak.

Mobile app calls this after scanning the QR on the Keycloak Required Action page. Returns a fresh nonce and creates pairing state keyed by JWT `jti`. 

### Example
```dart
import 'package:openapi_client/api.dart';

final api = OpenapiClient().getPairingApi();
final PairingInitRequest pairingInitRequest = ; // PairingInitRequest | 

try {
    final response = api.externalPairingInit(pairingInitRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling PairingApi->externalPairingInit: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pairingInitRequest** | [**PairingInitRequest**](PairingInitRequest.md)|  | 

### Return type

[**PairingInitResponse**](PairingInitResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

