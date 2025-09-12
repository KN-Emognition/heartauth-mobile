# openapi_client.api.WellKnownApi

## Load the API package
```dart
import 'package:openapi_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getJwks**](WellKnownApi.md#getjwks) | **GET** /.well-known/jwks.json | Get JSON Web Key Set (JWKS)


# **getJwks**
> JwkSet getJwks()

Get JSON Web Key Set (JWKS)

### Example
```dart
import 'package:openapi_client/api.dart';

final api = OpenapiClient().getWellKnownApi();

try {
    final response = api.getJwks();
    print(response);
} catch on DioException (e) {
    print('Exception when calling WellKnownApi->getJwks: $e\n');
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

