// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_confirm_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PairingConfirmResponseStatusEnum
    _$pairingConfirmResponseStatusEnum_linked =
    const PairingConfirmResponseStatusEnum._('linked');

PairingConfirmResponseStatusEnum _$pairingConfirmResponseStatusEnumValueOf(
    String name) {
  switch (name) {
    case 'linked':
      return _$pairingConfirmResponseStatusEnum_linked;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PairingConfirmResponseStatusEnum>
    _$pairingConfirmResponseStatusEnumValues = BuiltSet<
        PairingConfirmResponseStatusEnum>(const <PairingConfirmResponseStatusEnum>[
  _$pairingConfirmResponseStatusEnum_linked,
]);

Serializer<PairingConfirmResponseStatusEnum>
    _$pairingConfirmResponseStatusEnumSerializer =
    _$PairingConfirmResponseStatusEnumSerializer();

class _$PairingConfirmResponseStatusEnumSerializer
    implements PrimitiveSerializer<PairingConfirmResponseStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'linked': 'linked',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'linked': 'linked',
  };

  @override
  final Iterable<Type> types = const <Type>[PairingConfirmResponseStatusEnum];
  @override
  final String wireName = 'PairingConfirmResponseStatusEnum';

  @override
  Object serialize(
          Serializers serializers, PairingConfirmResponseStatusEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PairingConfirmResponseStatusEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PairingConfirmResponseStatusEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$PairingConfirmResponse extends PairingConfirmResponse {
  @override
  final PairingConfirmResponseStatusEnum status;
  @override
  final DeviceCredential? credential;

  factory _$PairingConfirmResponse(
          [void Function(PairingConfirmResponseBuilder)? updates]) =>
      (PairingConfirmResponseBuilder()..update(updates))._build();

  _$PairingConfirmResponse._({required this.status, this.credential})
      : super._();
  @override
  PairingConfirmResponse rebuild(
          void Function(PairingConfirmResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PairingConfirmResponseBuilder toBuilder() =>
      PairingConfirmResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PairingConfirmResponse &&
        status == other.status &&
        credential == other.credential;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, credential.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PairingConfirmResponse')
          ..add('status', status)
          ..add('credential', credential))
        .toString();
  }
}

class PairingConfirmResponseBuilder
    implements Builder<PairingConfirmResponse, PairingConfirmResponseBuilder> {
  _$PairingConfirmResponse? _$v;

  PairingConfirmResponseStatusEnum? _status;
  PairingConfirmResponseStatusEnum? get status => _$this._status;
  set status(PairingConfirmResponseStatusEnum? status) =>
      _$this._status = status;

  DeviceCredentialBuilder? _credential;
  DeviceCredentialBuilder get credential =>
      _$this._credential ??= DeviceCredentialBuilder();
  set credential(DeviceCredentialBuilder? credential) =>
      _$this._credential = credential;

  PairingConfirmResponseBuilder() {
    PairingConfirmResponse._defaults(this);
  }

  PairingConfirmResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _credential = $v.credential?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PairingConfirmResponse other) {
    _$v = other as _$PairingConfirmResponse;
  }

  @override
  void update(void Function(PairingConfirmResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PairingConfirmResponse build() => _build();

  _$PairingConfirmResponse _build() {
    _$PairingConfirmResponse _$result;
    try {
      _$result = _$v ??
          _$PairingConfirmResponse._(
            status: BuiltValueNullFieldError.checkNotNull(
                status, r'PairingConfirmResponse', 'status'),
            credential: _credential?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'credential';
        _credential?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PairingConfirmResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
