// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_status_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PairingStatusResponseStateEnum _$pairingStatusResponseStateEnum_pending =
    const PairingStatusResponseStateEnum._('pending');
const PairingStatusResponseStateEnum _$pairingStatusResponseStateEnum_linked =
    const PairingStatusResponseStateEnum._('linked');
const PairingStatusResponseStateEnum _$pairingStatusResponseStateEnum_expired =
    const PairingStatusResponseStateEnum._('expired');
const PairingStatusResponseStateEnum _$pairingStatusResponseStateEnum_replayed =
    const PairingStatusResponseStateEnum._('replayed');
const PairingStatusResponseStateEnum _$pairingStatusResponseStateEnum_denied =
    const PairingStatusResponseStateEnum._('denied');

PairingStatusResponseStateEnum _$pairingStatusResponseStateEnumValueOf(
    String name) {
  switch (name) {
    case 'pending':
      return _$pairingStatusResponseStateEnum_pending;
    case 'linked':
      return _$pairingStatusResponseStateEnum_linked;
    case 'expired':
      return _$pairingStatusResponseStateEnum_expired;
    case 'replayed':
      return _$pairingStatusResponseStateEnum_replayed;
    case 'denied':
      return _$pairingStatusResponseStateEnum_denied;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PairingStatusResponseStateEnum>
    _$pairingStatusResponseStateEnumValues = BuiltSet<
        PairingStatusResponseStateEnum>(const <PairingStatusResponseStateEnum>[
  _$pairingStatusResponseStateEnum_pending,
  _$pairingStatusResponseStateEnum_linked,
  _$pairingStatusResponseStateEnum_expired,
  _$pairingStatusResponseStateEnum_replayed,
  _$pairingStatusResponseStateEnum_denied,
]);

Serializer<PairingStatusResponseStateEnum>
    _$pairingStatusResponseStateEnumSerializer =
    _$PairingStatusResponseStateEnumSerializer();

class _$PairingStatusResponseStateEnumSerializer
    implements PrimitiveSerializer<PairingStatusResponseStateEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'linked': 'linked',
    'expired': 'expired',
    'replayed': 'replayed',
    'denied': 'denied',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'linked': 'linked',
    'expired': 'expired',
    'replayed': 'replayed',
    'denied': 'denied',
  };

  @override
  final Iterable<Type> types = const <Type>[PairingStatusResponseStateEnum];
  @override
  final String wireName = 'PairingStatusResponseStateEnum';

  @override
  Object serialize(
          Serializers serializers, PairingStatusResponseStateEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PairingStatusResponseStateEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PairingStatusResponseStateEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$PairingStatusResponse extends PairingStatusResponse {
  @override
  final PairingStatusResponseStateEnum state;
  @override
  final String? reason;

  factory _$PairingStatusResponse(
          [void Function(PairingStatusResponseBuilder)? updates]) =>
      (PairingStatusResponseBuilder()..update(updates))._build();

  _$PairingStatusResponse._({required this.state, this.reason}) : super._();
  @override
  PairingStatusResponse rebuild(
          void Function(PairingStatusResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PairingStatusResponseBuilder toBuilder() =>
      PairingStatusResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PairingStatusResponse &&
        state == other.state &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PairingStatusResponse')
          ..add('state', state)
          ..add('reason', reason))
        .toString();
  }
}

class PairingStatusResponseBuilder
    implements Builder<PairingStatusResponse, PairingStatusResponseBuilder> {
  _$PairingStatusResponse? _$v;

  PairingStatusResponseStateEnum? _state;
  PairingStatusResponseStateEnum? get state => _$this._state;
  set state(PairingStatusResponseStateEnum? state) => _$this._state = state;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  PairingStatusResponseBuilder() {
    PairingStatusResponse._defaults(this);
  }

  PairingStatusResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _state = $v.state;
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PairingStatusResponse other) {
    _$v = other as _$PairingStatusResponse;
  }

  @override
  void update(void Function(PairingStatusResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PairingStatusResponse build() => _build();

  _$PairingStatusResponse _build() {
    final _$result = _$v ??
        _$PairingStatusResponse._(
          state: BuiltValueNullFieldError.checkNotNull(
              state, r'PairingStatusResponse', 'state'),
          reason: reason,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
