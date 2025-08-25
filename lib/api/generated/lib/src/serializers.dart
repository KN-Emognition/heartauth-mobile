//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi_client/src/date_serializer.dart';
import 'package:openapi_client/src/model/date.dart';

import 'package:openapi_client/src/model/attestation.dart';
import 'package:openapi_client/src/model/challenge_complete_request.dart';
import 'package:openapi_client/src/model/challenge_create_request.dart';
import 'package:openapi_client/src/model/challenge_create_response.dart';
import 'package:openapi_client/src/model/challenge_status_response.dart';
import 'package:openapi_client/src/model/device_credential.dart';
import 'package:openapi_client/src/model/error.dart';
import 'package:openapi_client/src/model/healthz_get200_response.dart';
import 'package:openapi_client/src/model/pairing_confirm_request.dart';
import 'package:openapi_client/src/model/pairing_confirm_response.dart';
import 'package:openapi_client/src/model/pairing_init_request.dart';
import 'package:openapi_client/src/model/pairing_init_response.dart';
import 'package:openapi_client/src/model/pairing_init_response_policy.dart';
import 'package:openapi_client/src/model/pairing_status_response.dart';

part 'serializers.g.dart';

@SerializersFor([
  Attestation,
  ChallengeCompleteRequest,
  ChallengeCreateRequest,
  ChallengeCreateResponse,
  ChallengeStatusResponse,
  DeviceCredential,
  Error,
  HealthzGet200Response,
  PairingConfirmRequest,
  PairingConfirmResponse,
  PairingInitRequest,
  PairingInitResponse,
  PairingInitResponsePolicy,
  PairingStatusResponse,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
