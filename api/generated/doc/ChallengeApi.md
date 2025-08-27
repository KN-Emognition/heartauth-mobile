# openapi_client.api.ChallengeApi

## Load the API package
```dart
import 'package:openapi_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**externalChallengeComplete**](ChallengeApi.md#externalchallengecomplete) | **POST** /external/v1/challenge/{id}/complete | Complete a challenge from the device after ECG pass and signature verification.


# **externalChallengeComplete**
> ChallengeStatusResponse externalChallengeComplete(id, challengeCompleteRequest, dPoP)

Complete a challenge from the device after ECG pass and signature verification.

Mobile app posts a signed assertion proving possession of the device key. Server validates signature (using stored public key), nonce, and policy. 

### Example
```dart
import 'package:openapi_client/api.dart';

final api = OpenapiClient().getChallengeApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | Challenge ID (UUID).
final ChallengeCompleteRequest challengeCompleteRequest = {"assertionJwt":"eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCJ9.eyJjaGFsbGVuZ2VJZCI6Ijc5ZjFhODMzLTI...","matchScore":0.94,"biometricPassed":true}; // ChallengeCompleteRequest | 
final String dPoP = dPoP_example; // String | Optional DPoP proof header (JWS). If present, validate proof-of-possession.

try {
    final response = api.externalChallengeComplete(id, challengeCompleteRequest, dPoP);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ChallengeApi->externalChallengeComplete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Challenge ID (UUID). | 
 **challengeCompleteRequest** | [**ChallengeCompleteRequest**](ChallengeCompleteRequest.md)|  | 
 **dPoP** | **String**| Optional DPoP proof header (JWS). If present, validate proof-of-possession. | [optional] 

### Return type

[**ChallengeStatusResponse**](ChallengeStatusResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

