// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encryption_algo.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const EncryptionAlgo _$eS256 = const EncryptionAlgo._('eS256');

EncryptionAlgo _$valueOf(String name) {
  switch (name) {
    case 'eS256':
      return _$eS256;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<EncryptionAlgo> _$values =
    new BuiltSet<EncryptionAlgo>(const <EncryptionAlgo>[
  _$eS256,
]);

class _$EncryptionAlgoMeta {
  const _$EncryptionAlgoMeta();
  EncryptionAlgo get eS256 => _$eS256;
  EncryptionAlgo valueOf(String name) => _$valueOf(name);
  BuiltSet<EncryptionAlgo> get values => _$values;
}

abstract class _$EncryptionAlgoMixin {
  // ignore: non_constant_identifier_names
  _$EncryptionAlgoMeta get EncryptionAlgo => const _$EncryptionAlgoMeta();
}

Serializer<EncryptionAlgo> _$encryptionAlgoSerializer =
    new _$EncryptionAlgoSerializer();

class _$EncryptionAlgoSerializer
    implements PrimitiveSerializer<EncryptionAlgo> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'eS256': 'ES256',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ES256': 'eS256',
  };

  @override
  final Iterable<Type> types = const <Type>[EncryptionAlgo];
  @override
  final String wireName = 'EncryptionAlgo';

  @override
  Object serialize(Serializers serializers, EncryptionAlgo object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  EncryptionAlgo deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      EncryptionAlgo.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
