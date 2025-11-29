//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'init_pairing_response.g.dart';

/// InitPairingResponse
///
/// Properties:
/// * [nonce]
/// * [expiresAt]
/// * [username]
@BuiltValue()
abstract class InitPairingResponse
    implements Built<InitPairingResponse, InitPairingResponseBuilder> {
  @BuiltValueField(wireName: r'nonce')
  String get nonce;

  @BuiltValueField(wireName: r'expiresAt')
  int get expiresAt;

  @BuiltValueField(wireName: r'username')
  String get username;

  InitPairingResponse._();

  factory InitPairingResponse([void updates(InitPairingResponseBuilder b)]) =
      _$InitPairingResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitPairingResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitPairingResponse> get serializer =>
      _$InitPairingResponseSerializer();
}

class _$InitPairingResponseSerializer
    implements PrimitiveSerializer<InitPairingResponse> {
  @override
  final Iterable<Type> types = const [
    InitPairingResponse,
    _$InitPairingResponse
  ];

  @override
  final String wireName = r'InitPairingResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitPairingResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'nonce';
    yield serializers.serialize(
      object.nonce,
      specifiedType: const FullType(String),
    );
    yield r'expiresAt';
    yield serializers.serialize(
      object.expiresAt,
      specifiedType: const FullType(int),
    );
    yield r'username';
    yield serializers.serialize(
      object.username,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    InitPairingResponse object, {
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
    required InitPairingResponseBuilder result,
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
        case r'expiresAt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.expiresAt = valueDes;
          break;
        case r'username':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.username = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InitPairingResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitPairingResponseBuilder();
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
