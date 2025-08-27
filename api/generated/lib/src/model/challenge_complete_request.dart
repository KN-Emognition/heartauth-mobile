//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'challenge_complete_request.g.dart';

/// ChallengeCompleteRequest
///
/// Properties:
/// * [assertionJwt] - JWS (ES256) signed by the device key. Claims: challengeId, nonce, aud, iat, biometricPassed, matchScore, deviceId.
/// * [anything]
@BuiltValue()
abstract class ChallengeCompleteRequest
    implements
        Built<ChallengeCompleteRequest, ChallengeCompleteRequestBuilder> {
  /// JWS (ES256) signed by the device key. Claims: challengeId, nonce, aud, iat, biometricPassed, matchScore, deviceId.
  @BuiltValueField(wireName: r'assertionJwt')
  String get assertionJwt;

  @BuiltValueField(wireName: r'anything')
  String? get anything;

  ChallengeCompleteRequest._();

  factory ChallengeCompleteRequest(
          [void updates(ChallengeCompleteRequestBuilder b)]) =
      _$ChallengeCompleteRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChallengeCompleteRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChallengeCompleteRequest> get serializer =>
      _$ChallengeCompleteRequestSerializer();
}

class _$ChallengeCompleteRequestSerializer
    implements PrimitiveSerializer<ChallengeCompleteRequest> {
  @override
  final Iterable<Type> types = const [
    ChallengeCompleteRequest,
    _$ChallengeCompleteRequest
  ];

  @override
  final String wireName = r'ChallengeCompleteRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChallengeCompleteRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'assertionJwt';
    yield serializers.serialize(
      object.assertionJwt,
      specifiedType: const FullType(String),
    );
    if (object.anything != null) {
      yield r'anything';
      yield serializers.serialize(
        object.anything,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ChallengeCompleteRequest object, {
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
    required ChallengeCompleteRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'assertionJwt':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.assertionJwt = valueDes;
          break;
        case r'anything':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.anything = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChallengeCompleteRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChallengeCompleteRequestBuilder();
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
