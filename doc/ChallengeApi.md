# heartauth_mobile.api.ChallengeApi

## Load the API package
```dart
import 'package:heartauth_mobile/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**completeChallenge**](ChallengeApi.md#completechallenge) | **POST** /mobile/v1/challenge/{id}/complete | Complete a challenge from the device after ECG pass and signature verification.


# **completeChallenge**
> completeChallenge(id, completeChallengeRequest)

Complete a challenge from the device after ECG pass and signature verification.

Mobile app posts a signed assertion proving possession of the device key. Server validates signature (using stored public key), nonce, and policy. 

### Example
```dart
import 'package:heartauth_mobile/api.dart';

final api = HeartauthMobile().getChallengeApi();
final String id = 38400000-8cf0-11bd-b23e-10b96e4ef00d; // String | 
final CompleteChallengeRequest completeChallengeRequest = ; // CompleteChallengeRequest | 

try {
    api.completeChallenge(id, completeChallengeRequest);
} catch on DioException (e) {
    print('Exception when calling ChallengeApi->completeChallenge: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **completeChallengeRequest** | [**CompleteChallengeRequest**](CompleteChallengeRequest.md)|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

