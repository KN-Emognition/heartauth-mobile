//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'ec_jwk.g.dart';

/// ECJwk
///
/// Properties:
/// * [kty]
/// * [crv]
/// * [x]
/// * [y]
/// * [kid]
/// * [use]
/// * [alg]
/// * [x5u]
/// * [x5c]
/// * [x5t]
/// * [x5tHashS256]
@BuiltValue()
abstract class ECJwk implements Built<ECJwk, ECJwkBuilder> {
  @BuiltValueField(wireName: r'kty')
  ECJwkKtyEnum get kty;
  // enum ktyEnum {  EC,  };

  @BuiltValueField(wireName: r'crv')
  ECJwkCrvEnum get crv;
  // enum crvEnum {  P-256,  P-384,  P-521,  };

  @BuiltValueField(wireName: r'x')
  String get x;

  @BuiltValueField(wireName: r'y')
  String get y;

  @BuiltValueField(wireName: r'kid')
  String? get kid;

  @BuiltValueField(wireName: r'use')
  ECJwkUseEnum? get use;
  // enum useEnum {  sig,  enc,  };

  @BuiltValueField(wireName: r'alg')
  String? get alg;

  @BuiltValueField(wireName: r'x5u')
  String? get x5u;

  @BuiltValueField(wireName: r'x5c')
  BuiltList<String>? get x5c;

  @BuiltValueField(wireName: r'x5t')
  String? get x5t;

  @BuiltValueField(wireName: r'x5t#S256')
  String? get x5tHashS256;

  ECJwk._();

  factory ECJwk([void updates(ECJwkBuilder b)]) = _$ECJwk;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ECJwkBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ECJwk> get serializer => _$ECJwkSerializer();
}

class _$ECJwkSerializer implements PrimitiveSerializer<ECJwk> {
  @override
  final Iterable<Type> types = const [ECJwk, _$ECJwk];

  @override
  final String wireName = r'ECJwk';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ECJwk object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'kty';
    yield serializers.serialize(
      object.kty,
      specifiedType: const FullType(ECJwkKtyEnum),
    );
    yield r'crv';
    yield serializers.serialize(
      object.crv,
      specifiedType: const FullType(ECJwkCrvEnum),
    );
    yield r'x';
    yield serializers.serialize(
      object.x,
      specifiedType: const FullType(String),
    );
    yield r'y';
    yield serializers.serialize(
      object.y,
      specifiedType: const FullType(String),
    );
    if (object.kid != null) {
      yield r'kid';
      yield serializers.serialize(
        object.kid,
        specifiedType: const FullType(String),
      );
    }
    if (object.use != null) {
      yield r'use';
      yield serializers.serialize(
        object.use,
        specifiedType: const FullType(ECJwkUseEnum),
      );
    }
    if (object.alg != null) {
      yield r'alg';
      yield serializers.serialize(
        object.alg,
        specifiedType: const FullType(String),
      );
    }
    if (object.x5u != null) {
      yield r'x5u';
      yield serializers.serialize(
        object.x5u,
        specifiedType: const FullType(String),
      );
    }
    if (object.x5c != null) {
      yield r'x5c';
      yield serializers.serialize(
        object.x5c,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.x5t != null) {
      yield r'x5t';
      yield serializers.serialize(
        object.x5t,
        specifiedType: const FullType(String),
      );
    }
    if (object.x5tHashS256 != null) {
      yield r'x5t#S256';
      yield serializers.serialize(
        object.x5tHashS256,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ECJwk object, {
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
    required ECJwkBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'kty':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ECJwkKtyEnum),
          ) as ECJwkKtyEnum;
          result.kty = valueDes;
          break;
        case r'crv':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ECJwkCrvEnum),
          ) as ECJwkCrvEnum;
          result.crv = valueDes;
          break;
        case r'x':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.x = valueDes;
          break;
        case r'y':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.y = valueDes;
          break;
        case r'kid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.kid = valueDes;
          break;
        case r'use':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ECJwkUseEnum),
          ) as ECJwkUseEnum;
          result.use = valueDes;
          break;
        case r'alg':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.alg = valueDes;
          break;
        case r'x5u':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.x5u = valueDes;
          break;
        case r'x5c':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.x5c.replace(valueDes);
          break;
        case r'x5t':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.x5t = valueDes;
          break;
        case r'x5t#S256':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.x5tHashS256 = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ECJwk deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ECJwkBuilder();
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

class ECJwkKtyEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'EC')
  static const ECJwkKtyEnum EC = _$eCJwkKtyEnum_EC;

  static Serializer<ECJwkKtyEnum> get serializer => _$eCJwkKtyEnumSerializer;

  const ECJwkKtyEnum._(String name) : super(name);

  static BuiltSet<ECJwkKtyEnum> get values => _$eCJwkKtyEnumValues;
  static ECJwkKtyEnum valueOf(String name) => _$eCJwkKtyEnumValueOf(name);
}

class ECJwkCrvEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'P-256')
  static const ECJwkCrvEnum n256 = _$eCJwkCrvEnum_n256;
  @BuiltValueEnumConst(wireName: r'P-384')
  static const ECJwkCrvEnum n384 = _$eCJwkCrvEnum_n384;
  @BuiltValueEnumConst(wireName: r'P-521')
  static const ECJwkCrvEnum n521 = _$eCJwkCrvEnum_n521;

  static Serializer<ECJwkCrvEnum> get serializer => _$eCJwkCrvEnumSerializer;

  const ECJwkCrvEnum._(String name) : super(name);

  static BuiltSet<ECJwkCrvEnum> get values => _$eCJwkCrvEnumValues;
  static ECJwkCrvEnum valueOf(String name) => _$eCJwkCrvEnumValueOf(name);
}

class ECJwkUseEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'sig')
  static const ECJwkUseEnum sig = _$eCJwkUseEnum_sig;
  @BuiltValueEnumConst(wireName: r'enc')
  static const ECJwkUseEnum enc = _$eCJwkUseEnum_enc;

  static Serializer<ECJwkUseEnum> get serializer => _$eCJwkUseEnumSerializer;

  const ECJwkUseEnum._(String name) : super(name);

  static BuiltSet<ECJwkUseEnum> get values => _$eCJwkUseEnumValues;
  static ECJwkUseEnum valueOf(String name) => _$eCJwkUseEnumValueOf(name);
}
