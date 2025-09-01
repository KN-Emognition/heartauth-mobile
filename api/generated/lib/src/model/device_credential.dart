//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi_client/src/model/attestation.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'device_credential.g.dart';

/// DeviceCredential
///
/// Properties:
/// * [deviceId]
/// * [displayName]
/// * [publicKeyPem]
/// * [fcmToken]
/// * [createdAt]
/// * [attestation]
@BuiltValue()
abstract class DeviceCredential
    implements Built<DeviceCredential, DeviceCredentialBuilder> {
  @BuiltValueField(wireName: r'deviceId')
  String get deviceId;

  @BuiltValueField(wireName: r'displayName')
  String get displayName;

  @BuiltValueField(wireName: r'publicKeyPem')
  String get publicKeyPem;

  @BuiltValueField(wireName: r'fcmToken')
  String get fcmToken;

  @BuiltValueField(wireName: r'createdAt')
  int get createdAt;

  @BuiltValueField(wireName: r'attestation')
  Attestation? get attestation;

  DeviceCredential._();

  factory DeviceCredential([void updates(DeviceCredentialBuilder b)]) =
      _$DeviceCredential;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DeviceCredentialBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DeviceCredential> get serializer =>
      _$DeviceCredentialSerializer();
}

class _$DeviceCredentialSerializer
    implements PrimitiveSerializer<DeviceCredential> {
  @override
  final Iterable<Type> types = const [DeviceCredential, _$DeviceCredential];

  @override
  final String wireName = r'DeviceCredential';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DeviceCredential object, {
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
    yield r'createdAt';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(int),
    );
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
    DeviceCredential object, {
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
    required DeviceCredentialBuilder result,
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
        case r'createdAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.createdAt = valueDes;
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
  DeviceCredential deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DeviceCredentialBuilder();
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
