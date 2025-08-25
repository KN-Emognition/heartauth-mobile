//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pairing_confirm_request.g.dart';

/// PairingConfirmRequest
///
/// Properties:
/// * [jti]
/// * [deviceId]
/// * [signature] - Base64url-encoded DER ECDSA signature of SHA-256 over the byte-concatenation: `nonce || jti || deviceId`. The `nonce` is the raw bytes returned by init.
/// * [alg]
/// * [dpop] - Optional DPoP JWS sent in the `DPoP` header.
@BuiltValue()
abstract class PairingConfirmRequest
    implements Built<PairingConfirmRequest, PairingConfirmRequestBuilder> {
  @BuiltValueField(wireName: r'jti')
  String get jti;

  @BuiltValueField(wireName: r'deviceId')
  String get deviceId;

  /// Base64url-encoded DER ECDSA signature of SHA-256 over the byte-concatenation: `nonce || jti || deviceId`. The `nonce` is the raw bytes returned by init.
  @BuiltValueField(wireName: r'signature')
  String get signature;

  @BuiltValueField(wireName: r'alg')
  PairingConfirmRequestAlgEnum get alg;
  // enum algEnum {  ES256,  };

  /// Optional DPoP JWS sent in the `DPoP` header.
  @BuiltValueField(wireName: r'dpop')
  String? get dpop;

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
    yield r'jti';
    yield serializers.serialize(
      object.jti,
      specifiedType: const FullType(String),
    );
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
      specifiedType: const FullType(PairingConfirmRequestAlgEnum),
    );
    if (object.dpop != null) {
      yield r'dpop';
      yield serializers.serialize(
        object.dpop,
        specifiedType: const FullType.nullable(String),
      );
    }
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
        case r'jti':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.jti = valueDes;
          break;
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
            specifiedType: const FullType(PairingConfirmRequestAlgEnum),
          ) as PairingConfirmRequestAlgEnum;
          result.alg = valueDes;
          break;
        case r'dpop':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dpop = valueDes;
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

class PairingConfirmRequestAlgEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'ES256')
  static const PairingConfirmRequestAlgEnum eS256 =
      _$pairingConfirmRequestAlgEnum_eS256;

  static Serializer<PairingConfirmRequestAlgEnum> get serializer =>
      _$pairingConfirmRequestAlgEnumSerializer;

  const PairingConfirmRequestAlgEnum._(String name) : super(name);

  static BuiltSet<PairingConfirmRequestAlgEnum> get values =>
      _$pairingConfirmRequestAlgEnumValues;
  static PairingConfirmRequestAlgEnum valueOf(String name) =>
      _$pairingConfirmRequestAlgEnumValueOf(name);
}
