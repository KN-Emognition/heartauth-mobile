//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi_client/src/model/pairing_init_response_policy.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pairing_init_response.g.dart';

/// PairingInitResponse
///
/// Properties:
/// * [jti]
/// * [nonce] - Base64 random 32-byte nonce.
/// * [exp] - Expiration (epoch seconds).
/// * [policy]
@BuiltValue()
abstract class PairingInitResponse
    implements Built<PairingInitResponse, PairingInitResponseBuilder> {
  @BuiltValueField(wireName: r'jti')
  String get jti;

  /// Base64 random 32-byte nonce.
  @BuiltValueField(wireName: r'nonce')
  String get nonce;

  /// Expiration (epoch seconds).
  @BuiltValueField(wireName: r'exp')
  int get exp;

  @BuiltValueField(wireName: r'policy')
  PairingInitResponsePolicy? get policy;

  PairingInitResponse._();

  factory PairingInitResponse([void updates(PairingInitResponseBuilder b)]) =
      _$PairingInitResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PairingInitResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PairingInitResponse> get serializer =>
      _$PairingInitResponseSerializer();
}

class _$PairingInitResponseSerializer
    implements PrimitiveSerializer<PairingInitResponse> {
  @override
  final Iterable<Type> types = const [
    PairingInitResponse,
    _$PairingInitResponse
  ];

  @override
  final String wireName = r'PairingInitResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PairingInitResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'jti';
    yield serializers.serialize(
      object.jti,
      specifiedType: const FullType(String),
    );
    yield r'nonce';
    yield serializers.serialize(
      object.nonce,
      specifiedType: const FullType(String),
    );
    yield r'exp';
    yield serializers.serialize(
      object.exp,
      specifiedType: const FullType(int),
    );
    if (object.policy != null) {
      yield r'policy';
      yield serializers.serialize(
        object.policy,
        specifiedType: const FullType.nullable(PairingInitResponsePolicy),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PairingInitResponse object, {
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
    required PairingInitResponseBuilder result,
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
        case r'nonce':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nonce = valueDes;
          break;
        case r'exp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.exp = valueDes;
          break;
        case r'policy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(PairingInitResponsePolicy),
          ) as PairingInitResponsePolicy?;
          if (valueDes == null) continue;
          result.policy.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PairingInitResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PairingInitResponseBuilder();
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
