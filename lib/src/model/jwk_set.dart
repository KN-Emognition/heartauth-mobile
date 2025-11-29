//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:heartauth_mobile/src/model/ec_jwk.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'jwk_set.g.dart';

/// JwkSet
///
/// Properties:
/// * [keys]
@BuiltValue()
abstract class JwkSet implements Built<JwkSet, JwkSetBuilder> {
  @BuiltValueField(wireName: r'keys')
  BuiltList<ECJwk> get keys;

  JwkSet._();

  factory JwkSet([void updates(JwkSetBuilder b)]) = _$JwkSet;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JwkSetBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JwkSet> get serializer => _$JwkSetSerializer();
}

class _$JwkSetSerializer implements PrimitiveSerializer<JwkSet> {
  @override
  final Iterable<Type> types = const [JwkSet, _$JwkSet];

  @override
  final String wireName = r'JwkSet';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JwkSet object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'keys';
    yield serializers.serialize(
      object.keys,
      specifiedType: const FullType(BuiltList, [FullType(ECJwk)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    JwkSet object, {
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
    required JwkSetBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'keys':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ECJwk)]),
          ) as BuiltList<ECJwk>;
          result.keys.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JwkSet deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JwkSetBuilder();
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
