# heartauth_mobile.api.WellKnownApi

## Load the API package
```dart
import 'package:heartauth_mobile/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getWellKnown**](WellKnownApi.md#getwellknown) | **GET** /.well-known/jwks.json | Get JSON Web Key Set (JWKS)


# **getWellKnown**
> JwkSet getWellKnown()

Get JSON Web Key Set (JWKS)

### Example
```dart
import 'package:heartauth_mobile/api.dart';

final api = HeartauthMobile().getWellKnownApi();

try {
    final response = api.getWellKnown();
    print(response);
} catch on DioException (e) {
    print('Exception when calling WellKnownApi->getWellKnown: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**JwkSet**](JwkSet.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

