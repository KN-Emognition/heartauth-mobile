//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'attestation.g.dart';

/// Attestation
///
/// Properties:
/// * [type]
/// * [verdict]
/// * [payload]
@BuiltValue()
abstract class Attestation implements Built<Attestation, AttestationBuilder> {
  @BuiltValueField(wireName: r'type')
  AttestationTypeEnum? get type;
  // enum typeEnum {  play-integrity,  safety-net,  devicecheck,  none,  };

  @BuiltValueField(wireName: r'verdict')
  String? get verdict;

  @BuiltValueField(wireName: r'payload')
  BuiltMap<String, JsonObject?>? get payload;

  Attestation._();

  factory Attestation([void updates(AttestationBuilder b)]) = _$Attestation;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AttestationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Attestation> get serializer => _$AttestationSerializer();
}

class _$AttestationSerializer implements PrimitiveSerializer<Attestation> {
  @override
  final Iterable<Type> types = const [Attestation, _$Attestation];

  @override
  final String wireName = r'Attestation';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Attestation object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.type != null) {
      yield r'type';
      yield serializers.serialize(
        object.type,
        specifiedType: const FullType(AttestationTypeEnum),
      );
    }
    if (object.verdict != null) {
      yield r'verdict';
      yield serializers.serialize(
        object.verdict,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.payload != null) {
      yield r'payload';
      yield serializers.serialize(
        object.payload,
        specifiedType: const FullType.nullable(
            BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Attestation object, {
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
    required AttestationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AttestationTypeEnum),
          ) as AttestationTypeEnum;
          result.type = valueDes;
          break;
        case r'verdict':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.verdict = valueDes;
          break;
        case r'payload':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(
                BuiltMap, [FullType(String), FullType.nullable(JsonObject)]),
          ) as BuiltMap<String, JsonObject?>?;
          if (valueDes == null) continue;
          result.payload.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Attestation deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AttestationBuilder();
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

class AttestationTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'play-integrity')
  static const AttestationTypeEnum playIntegrity =
      _$attestationTypeEnum_playIntegrity;
  @BuiltValueEnumConst(wireName: r'safety-net')
  static const AttestationTypeEnum safetyNet = _$attestationTypeEnum_safetyNet;
  @BuiltValueEnumConst(wireName: r'devicecheck')
  static const AttestationTypeEnum devicecheck =
      _$attestationTypeEnum_devicecheck;
  @BuiltValueEnumConst(wireName: r'none')
  static const AttestationTypeEnum none = _$attestationTypeEnum_none;

  static Serializer<AttestationTypeEnum> get serializer =>
      _$attestationTypeEnumSerializer;

  const AttestationTypeEnum._(String name) : super(name);

  static BuiltSet<AttestationTypeEnum> get values =>
      _$attestationTypeEnumValues;
  static AttestationTypeEnum valueOf(String name) =>
      _$attestationTypeEnumValueOf(name);
}
