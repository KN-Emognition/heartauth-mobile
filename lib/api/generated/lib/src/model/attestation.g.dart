// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attestation.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AttestationTypeEnum _$attestationTypeEnum_playIntegrity =
    const AttestationTypeEnum._('playIntegrity');
const AttestationTypeEnum _$attestationTypeEnum_safetyNet =
    const AttestationTypeEnum._('safetyNet');
const AttestationTypeEnum _$attestationTypeEnum_devicecheck =
    const AttestationTypeEnum._('devicecheck');
const AttestationTypeEnum _$attestationTypeEnum_none =
    const AttestationTypeEnum._('none');

AttestationTypeEnum _$attestationTypeEnumValueOf(String name) {
  switch (name) {
    case 'playIntegrity':
      return _$attestationTypeEnum_playIntegrity;
    case 'safetyNet':
      return _$attestationTypeEnum_safetyNet;
    case 'devicecheck':
      return _$attestationTypeEnum_devicecheck;
    case 'none':
      return _$attestationTypeEnum_none;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AttestationTypeEnum> _$attestationTypeEnumValues =
    BuiltSet<AttestationTypeEnum>(const <AttestationTypeEnum>[
  _$attestationTypeEnum_playIntegrity,
  _$attestationTypeEnum_safetyNet,
  _$attestationTypeEnum_devicecheck,
  _$attestationTypeEnum_none,
]);

Serializer<AttestationTypeEnum> _$attestationTypeEnumSerializer =
    _$AttestationTypeEnumSerializer();

class _$AttestationTypeEnumSerializer
    implements PrimitiveSerializer<AttestationTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'playIntegrity': 'play-integrity',
    'safetyNet': 'safety-net',
    'devicecheck': 'devicecheck',
    'none': 'none',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'play-integrity': 'playIntegrity',
    'safety-net': 'safetyNet',
    'devicecheck': 'devicecheck',
    'none': 'none',
  };

  @override
  final Iterable<Type> types = const <Type>[AttestationTypeEnum];
  @override
  final String wireName = 'AttestationTypeEnum';

  @override
  Object serialize(Serializers serializers, AttestationTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  AttestationTypeEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AttestationTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$Attestation extends Attestation {
  @override
  final AttestationTypeEnum? type;
  @override
  final String? verdict;
  @override
  final BuiltMap<String, JsonObject?>? payload;

  factory _$Attestation([void Function(AttestationBuilder)? updates]) =>
      (AttestationBuilder()..update(updates))._build();

  _$Attestation._({this.type, this.verdict, this.payload}) : super._();
  @override
  Attestation rebuild(void Function(AttestationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AttestationBuilder toBuilder() => AttestationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Attestation &&
        type == other.type &&
        verdict == other.verdict &&
        payload == other.payload;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, verdict.hashCode);
    _$hash = $jc(_$hash, payload.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Attestation')
          ..add('type', type)
          ..add('verdict', verdict)
          ..add('payload', payload))
        .toString();
  }
}

class AttestationBuilder implements Builder<Attestation, AttestationBuilder> {
  _$Attestation? _$v;

  AttestationTypeEnum? _type;
  AttestationTypeEnum? get type => _$this._type;
  set type(AttestationTypeEnum? type) => _$this._type = type;

  String? _verdict;
  String? get verdict => _$this._verdict;
  set verdict(String? verdict) => _$this._verdict = verdict;

  MapBuilder<String, JsonObject?>? _payload;
  MapBuilder<String, JsonObject?> get payload =>
      _$this._payload ??= MapBuilder<String, JsonObject?>();
  set payload(MapBuilder<String, JsonObject?>? payload) =>
      _$this._payload = payload;

  AttestationBuilder() {
    Attestation._defaults(this);
  }

  AttestationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _verdict = $v.verdict;
      _payload = $v.payload?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Attestation other) {
    _$v = other as _$Attestation;
  }

  @override
  void update(void Function(AttestationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Attestation build() => _build();

  _$Attestation _build() {
    _$Attestation _$result;
    try {
      _$result = _$v ??
          _$Attestation._(
            type: type,
            verdict: verdict,
            payload: _payload?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'payload';
        _payload?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'Attestation', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
