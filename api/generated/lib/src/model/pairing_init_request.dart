//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi_client/src/model/attestation.dart';
import 'package:openapi_client/src/model/platform.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pairing_init_request.g.dart';

/// PairingInitRequest
///
/// Properties:
/// * [deviceId] - Stable device identifier.
/// * [displayName]
/// * [publicKeyPem] - PEM-encoded ECDSA P-256 public key.
/// * [fcmToken] - Firebase Cloud Messaging token.
/// * [platform]
/// * [osVersion]
/// * [model]
/// * [attestation]
@BuiltValue()
abstract class PairingInitRequest
    implements Built<PairingInitRequest, PairingInitRequestBuilder> {
  /// Stable device identifier.
  @BuiltValueField(wireName: r'deviceId')
  String get deviceId;

  @BuiltValueField(wireName: r'displayName')
  String get displayName;

  /// PEM-encoded ECDSA P-256 public key.
  @BuiltValueField(wireName: r'publicKeyPem')
  String get publicKeyPem;

  /// Firebase Cloud Messaging token.
  @BuiltValueField(wireName: r'fcmToken')
  String get fcmToken;

  @BuiltValueField(wireName: r'platform')
  Platform get platform;
  // enum platformEnum {  ANDROID,  IOS,  };

  @BuiltValueField(wireName: r'osVersion')
  String? get osVersion;

  @BuiltValueField(wireName: r'model')
  String? get model;

  @BuiltValueField(wireName: r'attestation')
  Attestation? get attestation;

  PairingInitRequest._();

  factory PairingInitRequest([void updates(PairingInitRequestBuilder b)]) =
      _$PairingInitRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PairingInitRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PairingInitRequest> get serializer =>
      _$PairingInitRequestSerializer();
}

class _$PairingInitRequestSerializer
    implements PrimitiveSerializer<PairingInitRequest> {
  @override
  final Iterable<Type> types = const [PairingInitRequest, _$PairingInitRequest];

  @override
  final String wireName = r'PairingInitRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PairingInitRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'deviceId';
    yield serializers.serialize(
      object.deviceId,
      specifiedType: const FullType(String),
    );
    yield r'displayName';
    yield serializers.serialize(
      object.displayName,
      specifiedType: const FullType(String),
    );
    yield r'publicKeyPem';
    yield serializers.serialize(
      object.publicKeyPem,
      specifiedType: const FullType(String),
    );
    yield r'fcmToken';
    yield serializers.serialize(
      object.fcmToken,
      specifiedType: const FullType(String),
    );
    yield r'platform';
    yield serializers.serialize(
      object.platform,
      specifiedType: const FullType(Platform),
    );
    if (object.osVersion != null) {
      yield r'osVersion';
      yield serializers.serialize(
        object.osVersion,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.model != null) {
      yield r'model';
      yield serializers.serialize(
        object.model,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.attestation != null) {
      yield r'attestation';
      yield serializers.serialize(
        object.attestation,
        specifiedType: const FullType(Attestation),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PairingInitRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PairingInitRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deviceId = valueDes;
          break;
        case r'displayName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.displayName = valueDes;
          break;
        case r'publicKeyPem':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.publicKeyPem = valueDes;
          break;
        case r'fcmToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fcmToken = valueDes;
          break;
        case r'platform':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Platform),
          ) as Platform;
          result.platform = valueDes;
          break;
        case r'osVersion':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.osVersion = valueDes;
          break;
        case r'model':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.model = valueDes;
          break;
        case r'attestation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Attestation),
          ) as Attestation;
          result.attestation.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PairingInitRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PairingInitRequestBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
