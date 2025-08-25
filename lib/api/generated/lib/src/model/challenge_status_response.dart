//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'challenge_status_response.g.dart';

/// ChallengeStatusResponse
///
/// Properties:
/// * [state]
/// * [reason]
@BuiltValue()
abstract class ChallengeStatusResponse
    implements Built<ChallengeStatusResponse, ChallengeStatusResponseBuilder> {
  @BuiltValueField(wireName: r'state')
  ChallengeStatusResponseStateEnum get state;
  // enum stateEnum {  pending,  approved,  denied,  expired,  };

  @BuiltValueField(wireName: r'reason')
  ChallengeStatusResponseReasonEnum? get reason;
  // enum reasonEnum {  low_score,  user_cancelled,  timeout,  policy,  };

  ChallengeStatusResponse._();

  factory ChallengeStatusResponse(
          [void updates(ChallengeStatusResponseBuilder b)]) =
      _$ChallengeStatusResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ChallengeStatusResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ChallengeStatusResponse> get serializer =>
      _$ChallengeStatusResponseSerializer();
}

class _$ChallengeStatusResponseSerializer
    implements PrimitiveSerializer<ChallengeStatusResponse> {
  @override
  final Iterable<Type> types = const [
    ChallengeStatusResponse,
    _$ChallengeStatusResponse
  ];

  @override
  final String wireName = r'ChallengeStatusResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ChallengeStatusResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'state';
    yield serializers.serialize(
      object.state,
      specifiedType: const FullType(ChallengeStatusResponseStateEnum),
    );
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType:
            const FullType.nullable(ChallengeStatusResponseReasonEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ChallengeStatusResponse object, {
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
    required ChallengeStatusResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ChallengeStatusResponseStateEnum),
          ) as ChallengeStatusResponseStateEnum;
          result.state = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType.nullable(ChallengeStatusResponseReasonEnum),
          ) as ChallengeStatusResponseReasonEnum?;
          if (valueDes == null) continue;
          result.reason = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ChallengeStatusResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ChallengeStatusResponseBuilder();
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

class ChallengeStatusResponseStateEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'pending')
  static const ChallengeStatusResponseStateEnum pending =
      _$challengeStatusResponseStateEnum_pending;
  @BuiltValueEnumConst(wireName: r'approved')
  static const ChallengeStatusResponseStateEnum approved =
      _$challengeStatusResponseStateEnum_approved;
  @BuiltValueEnumConst(wireName: r'denied')
  static const ChallengeStatusResponseStateEnum denied =
      _$challengeStatusResponseStateEnum_denied;
  @BuiltValueEnumConst(wireName: r'expired')
  static const ChallengeStatusResponseStateEnum expired =
      _$challengeStatusResponseStateEnum_expired;

  static Serializer<ChallengeStatusResponseStateEnum> get serializer =>
      _$challengeStatusResponseStateEnumSerializer;

  const ChallengeStatusResponseStateEnum._(String name) : super(name);

  static BuiltSet<ChallengeStatusResponseStateEnum> get values =>
      _$challengeStatusResponseStateEnumValues;
  static ChallengeStatusResponseStateEnum valueOf(String name) =>
      _$challengeStatusResponseStateEnumValueOf(name);
}

class ChallengeStatusResponseReasonEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'low_score')
  static const ChallengeStatusResponseReasonEnum lowScore =
      _$challengeStatusResponseReasonEnum_lowScore;
  @BuiltValueEnumConst(wireName: r'user_cancelled')
  static const ChallengeStatusResponseReasonEnum userCancelled =
      _$challengeStatusResponseReasonEnum_userCancelled;
  @BuiltValueEnumConst(wireName: r'timeout')
  static const ChallengeStatusResponseReasonEnum timeout =
      _$challengeStatusResponseReasonEnum_timeout;
  @BuiltValueEnumConst(wireName: r'policy')
  static const ChallengeStatusResponseReasonEnum policy =
      _$challengeStatusResponseReasonEnum_policy;

  static Serializer<ChallengeStatusResponseReasonEnum> get serializer =>
      _$challengeStatusResponseReasonEnumSerializer;

  const ChallengeStatusResponseReasonEnum._(String name) : super(name);

  static BuiltSet<ChallengeStatusResponseReasonEnum> get values =>
      _$challengeStatusResponseReasonEnumValues;
  static ChallengeStatusResponseReasonEnum valueOf(String name) =>
      _$challengeStatusResponseReasonEnumValueOf(name);
}
