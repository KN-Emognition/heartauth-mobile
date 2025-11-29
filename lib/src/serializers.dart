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
import 'package:heartauth_mobile/src/date_serializer.dart';
import 'package:heartauth_mobile/src/model/date.dart';

import 'package:heartauth_mobile/src/model/complete_challenge_request.dart';
import 'package:heartauth_mobile/src/model/complete_pairing_request.dart';
import 'package:heartauth_mobile/src/model/device_info.dart';
import 'package:heartauth_mobile/src/model/ec_jwk.dart';
import 'package:heartauth_mobile/src/model/encryption_algo.dart';
import 'package:heartauth_mobile/src/model/init_pairing_request.dart';
import 'package:heartauth_mobile/src/model/init_pairing_response.dart';
import 'package:heartauth_mobile/src/model/jwk_set.dart';
import 'package:heartauth_mobile/src/model/platform.dart';

part 'serializers.g.dart';

@SerializersFor([
  CompleteChallengeRequest,
  CompletePairingRequest,
  DeviceInfo,
  ECJwk,
  EncryptionAlgo,
  InitPairingRequest,
  InitPairingResponse,
  JwkSet,
  Platform,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
