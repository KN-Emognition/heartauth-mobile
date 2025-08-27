//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi_client/src/model/flow_status.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'challenge_status_response.g.dart';

/// ChallengeStatusResponse
///
/// Properties:
/// * [status]
/// * [reason]
@BuiltValue()
abstract class ChallengeStatusResponse
    implements Built<ChallengeStatusResponse, ChallengeStatusResponseBuilder> {
  @BuiltValueField(wireName: r'status')
  FlowStatus get status;
  // enum statusEnum {  PENDING,  APPROVED,  DENIED,  EXPIRED,  NOT_FOUND,  };

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
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(FlowStatus),
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FlowStatus),
          ) as FlowStatus;
          result.status = valueDes;
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
