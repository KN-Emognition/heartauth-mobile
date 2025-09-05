//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi_client/src/model/encryption_algo.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pairing_confirm_request.g.dart';

/// PairingConfirmRequest
///
/// Properties:
/// * [deviceId]
/// * [signature]
/// * [alg]
@BuiltValue()
abstract class PairingConfirmRequest
    implements Built<PairingConfirmRequest, PairingConfirmRequestBuilder> {
  @BuiltValueField(wireName: r'deviceId')
  String get deviceId;

  @BuiltValueField(wireName: r'signature')
  String get signature;

  @BuiltValueField(wireName: r'alg')
  EncryptionAlgo get alg;
  // enum algEnum {  ES256,  };

  PairingConfirmRequest._();

  factory PairingConfirmRequest(
      [void updates(PairingConfirmRequestBuilder b)]) = _$PairingConfirmRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PairingConfirmRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PairingConfirmRequest> get serializer =>
      _$PairingConfirmRequestSerializer();
}

class _$PairingConfirmRequestSerializer
    implements PrimitiveSerializer<PairingConfirmRequest> {
  @override
  final Iterable<Type> types = const [
    PairingConfirmRequest,
    _$PairingConfirmRequest
  ];

  @override
  final String wireName = r'PairingConfirmRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PairingConfirmRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'deviceId';
    yield serializers.serialize(
      object.deviceId,
      specifiedType: const FullType(String),
    );
    yield r'signature';
    yield serializers.serialize(
      object.signature,
      specifiedType: const FullType(String),
    );
    yield r'alg';
    yield serializers.serialize(
      object.alg,
      specifiedType: const FullType(EncryptionAlgo),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PairingConfirmRequest object, {
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
    required PairingConfirmRequestBuilder result,
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
        case r'signature':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.signature = valueDes;
          break;
        case r'alg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EncryptionAlgo),
          ) as EncryptionAlgo;
          result.alg = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PairingConfirmRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PairingConfirmRequestBuilder();
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
