//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pairing_init_response_policy.g.dart';

/// PairingInitResponsePolicy
///
/// Properties:
/// * [deviceLimitRemaining]
@BuiltValue()
abstract class PairingInitResponsePolicy
    implements
        Built<PairingInitResponsePolicy, PairingInitResponsePolicyBuilder> {
  @BuiltValueField(wireName: r'deviceLimitRemaining')
  int? get deviceLimitRemaining;

  PairingInitResponsePolicy._();

  factory PairingInitResponsePolicy(
          [void updates(PairingInitResponsePolicyBuilder b)]) =
      _$PairingInitResponsePolicy;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PairingInitResponsePolicyBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PairingInitResponsePolicy> get serializer =>
      _$PairingInitResponsePolicySerializer();
}

class _$PairingInitResponsePolicySerializer
    implements PrimitiveSerializer<PairingInitResponsePolicy> {
  @override
  final Iterable<Type> types = const [
    PairingInitResponsePolicy,
    _$PairingInitResponsePolicy
  ];

  @override
  final String wireName = r'PairingInitResponsePolicy';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PairingInitResponsePolicy object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.deviceLimitRemaining != null) {
      yield r'deviceLimitRemaining';
      yield serializers.serialize(
        object.deviceLimitRemaining,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PairingInitResponsePolicy object, {
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
    required PairingInitResponsePolicyBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'deviceLimitRemaining':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.deviceLimitRemaining = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PairingInitResponsePolicy deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PairingInitResponsePolicyBuilder();
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
