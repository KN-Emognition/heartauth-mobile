# openapi_client.model.PairingConfirmRequest

## Load the model package
```dart
import 'package:openapi_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**jti** | **String** |  | 
**deviceId** | **String** |  | 
**signature** | **String** | Base64url DER ECDSA over SHA-256(nonce||jti||deviceId). | 
**alg** | **String** |  | 
**dpop** | **String** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


