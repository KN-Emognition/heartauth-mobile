//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'complete_challenge_request.g.dart';

/// CompleteChallengeRequest
///
/// Properties:
/// * [dataToken] - JWT encrypted with ecgData
/// * [signature] - Signed nonce
@BuiltValue()
abstract class CompleteChallengeRequest
    implements
        Built<CompleteChallengeRequest, CompleteChallengeRequestBuilder> {
  /// JWT encrypted with ecgData
  @BuiltValueField(wireName: r'dataToken')
  String get dataToken;

  /// Signed nonce
  @BuiltValueField(wireName: r'signature')
  String get signature;

  CompleteChallengeRequest._();

  factory CompleteChallengeRequest(
          [void updates(CompleteChallengeRequestBuilder b)]) =
      _$CompleteChallengeRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CompleteChallengeRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CompleteChallengeRequest> get serializer =>
      _$CompleteChallengeRequestSerializer();
}

class _$CompleteChallengeRequestSerializer
    implements PrimitiveSerializer<CompleteChallengeRequest> {
  @override
  final Iterable<Type> types = const [
    CompleteChallengeRequest,
    _$CompleteChallengeRequest
  ];

  @override
  final String wireName = r'CompleteChallengeRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CompleteChallengeRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'dataToken';
    yield serializers.serialize(
      object.dataToken,
      specifiedType: const FullType(String),
    );
    yield r'signature';
    yield serializers.serialize(
      object.signature,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CompleteChallengeRequest object, {
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
    required CompleteChallengeRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'dataToken':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.dataToken = valueDes;
          break;
        case r'signature':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.signature = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CompleteChallengeRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CompleteChallengeRequestBuilder();
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
