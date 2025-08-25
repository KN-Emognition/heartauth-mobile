//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'challenge_create_response.g.dart';

/// ChallengeCreateResponse
///
/// Properties:
/// * [challengeId]
/// * [deviceId]
/// * [nonce] - Base64 random 32-byte nonce to be included in the device assertion.
/// * [exp]
@BuiltValue()
abstract class ChallengeCreateResponse
    implements Built<ChallengeCreateResponse, ChallengeCreateResponseBuilder> {
  @BuiltValueField(wireName: r'challengeId')
  String get challengeId;

  @BuiltValueField(wireName: r'deviceId')
  String get deviceId;

  /// Base64 random 32-byte nonce to be included in the device assertion.
  @BuiltValueField(wireName: r'nonce')
  String get nonce;

  @BuiltValueField(wireName: r'exp')
  int get exp;

  ChallengeCreateResponse._();

  factory ChallengeCreateResponse(
          [void updates(ChallengeCreateResponseBuilder b)]) =
      _$ChallengeCreateResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChallengeCreateResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChallengeCreateResponse> get serializer =>
      _$ChallengeCreateResponseSerializer();
}

class _$ChallengeCreateResponseSerializer
    implements PrimitiveSerializer<ChallengeCreateResponse> {
  @override
  final Iterable<Type> types = const [
    ChallengeCreateResponse,
    _$ChallengeCreateResponse
  ];

  @override
  final String wireName = r'ChallengeCreateResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChallengeCreateResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'challengeId';
    yield serializers.serialize(
      object.challengeId,
      specifiedType: const FullType(String),
    );
    yield r'deviceId';
    yield serializers.serialize(
      object.deviceId,
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
  }

  @override
  Object serialize(
    Serializers serializers,
    ChallengeCreateResponse object, {
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
    required ChallengeCreateResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'challengeId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.challengeId = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.deviceId = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChallengeCreateResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChallengeCreateResponseBuilder();
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
