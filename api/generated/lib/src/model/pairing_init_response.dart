//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pairing_init_response.g.dart';

/// PairingInitResponse
///
/// Properties:
/// * [nonce]
@BuiltValue()
abstract class PairingInitResponse
    implements Built<PairingInitResponse, PairingInitResponseBuilder> {
  @BuiltValueField(wireName: r'nonce')
  String get nonce;

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
    yield r'nonce';
    yield serializers.serialize(
      object.nonce,
      specifiedType: const FullType(String),
    );
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
        case r'nonce':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nonce = valueDes;
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
