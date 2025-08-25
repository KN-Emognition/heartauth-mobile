//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pairing_status_response.g.dart';

/// PairingStatusResponse
///
/// Properties:
/// * [state]
/// * [reason] - Optional reason for terminal states.
@BuiltValue()
abstract class PairingStatusResponse
    implements Built<PairingStatusResponse, PairingStatusResponseBuilder> {
  @BuiltValueField(wireName: r'state')
  PairingStatusResponseStateEnum get state;
  // enum stateEnum {  pending,  linked,  expired,  replayed,  denied,  };

  /// Optional reason for terminal states.
  @BuiltValueField(wireName: r'reason')
  String? get reason;

  PairingStatusResponse._();

  factory PairingStatusResponse(
      [void updates(PairingStatusResponseBuilder b)]) = _$PairingStatusResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PairingStatusResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PairingStatusResponse> get serializer =>
      _$PairingStatusResponseSerializer();
}

class _$PairingStatusResponseSerializer
    implements PrimitiveSerializer<PairingStatusResponse> {
  @override
  final Iterable<Type> types = const [
    PairingStatusResponse,
    _$PairingStatusResponse
  ];

  @override
  final String wireName = r'PairingStatusResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PairingStatusResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'state';
    yield serializers.serialize(
      object.state,
      specifiedType: const FullType(PairingStatusResponseStateEnum),
    );
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PairingStatusResponse object, {
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
    required PairingStatusResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'state':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PairingStatusResponseStateEnum),
          ) as PairingStatusResponseStateEnum;
          result.state = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
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
  PairingStatusResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PairingStatusResponseBuilder();
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

class PairingStatusResponseStateEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'pending')
  static const PairingStatusResponseStateEnum pending =
      _$pairingStatusResponseStateEnum_pending;
  @BuiltValueEnumConst(wireName: r'linked')
  static const PairingStatusResponseStateEnum linked =
      _$pairingStatusResponseStateEnum_linked;
  @BuiltValueEnumConst(wireName: r'expired')
  static const PairingStatusResponseStateEnum expired =
      _$pairingStatusResponseStateEnum_expired;
  @BuiltValueEnumConst(wireName: r'replayed')
  static const PairingStatusResponseStateEnum replayed =
      _$pairingStatusResponseStateEnum_replayed;
  @BuiltValueEnumConst(wireName: r'denied')
  static const PairingStatusResponseStateEnum denied =
      _$pairingStatusResponseStateEnum_denied;

  static Serializer<PairingStatusResponseStateEnum> get serializer =>
      _$pairingStatusResponseStateEnumSerializer;

  const PairingStatusResponseStateEnum._(String name) : super(name);

  static BuiltSet<PairingStatusResponseStateEnum> get values =>
      _$pairingStatusResponseStateEnumValues;
  static PairingStatusResponseStateEnum valueOf(String name) =>
      _$pairingStatusResponseStateEnumValueOf(name);
}
