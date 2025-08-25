//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'challenge_create_request.g.dart';

/// ChallengeCreateRequest
///
/// Properties:
/// * [userId] - Keycloak user ID.
/// * [deviceId] - If omitted, orchestrator selects the best available device.
/// * [ttlSeconds]
@BuiltValue()
abstract class ChallengeCreateRequest
    implements Built<ChallengeCreateRequest, ChallengeCreateRequestBuilder> {
  /// Keycloak user ID.
  @BuiltValueField(wireName: r'userId')
  String get userId;

  /// If omitted, orchestrator selects the best available device.
  @BuiltValueField(wireName: r'deviceId')
  String? get deviceId;

  @BuiltValueField(wireName: r'ttlSeconds')
  int? get ttlSeconds;

  ChallengeCreateRequest._();

  factory ChallengeCreateRequest(
          [void updates(ChallengeCreateRequestBuilder b)]) =
      _$ChallengeCreateRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChallengeCreateRequestBuilder b) => b..ttlSeconds = 120;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChallengeCreateRequest> get serializer =>
      _$ChallengeCreateRequestSerializer();
}

class _$ChallengeCreateRequestSerializer
    implements PrimitiveSerializer<ChallengeCreateRequest> {
  @override
  final Iterable<Type> types = const [
    ChallengeCreateRequest,
    _$ChallengeCreateRequest
  ];

  @override
  final String wireName = r'ChallengeCreateRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChallengeCreateRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'userId';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    if (object.deviceId != null) {
      yield r'deviceId';
      yield serializers.serialize(
        object.deviceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.ttlSeconds != null) {
      yield r'ttlSeconds';
      yield serializers.serialize(
        object.ttlSeconds,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ChallengeCreateRequest object, {
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
    required ChallengeCreateRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'userId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'deviceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.deviceId = valueDes;
          break;
        case r'ttlSeconds':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ttlSeconds = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChallengeCreateRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChallengeCreateRequestBuilder();
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
