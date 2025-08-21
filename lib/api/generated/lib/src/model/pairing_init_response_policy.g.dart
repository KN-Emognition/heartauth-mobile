// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_init_response_policy.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PairingInitResponsePolicy extends PairingInitResponsePolicy {
  @override
  final int? deviceLimitRemaining;

  factory _$PairingInitResponsePolicy(
          [void Function(PairingInitResponsePolicyBuilder)? updates]) =>
      (PairingInitResponsePolicyBuilder()..update(updates))._build();

  _$PairingInitResponsePolicy._({this.deviceLimitRemaining}) : super._();
  @override
  PairingInitResponsePolicy rebuild(
          void Function(PairingInitResponsePolicyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PairingInitResponsePolicyBuilder toBuilder() =>
      PairingInitResponsePolicyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PairingInitResponsePolicy &&
        deviceLimitRemaining == other.deviceLimitRemaining;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceLimitRemaining.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PairingInitResponsePolicy')
          ..add('deviceLimitRemaining', deviceLimitRemaining))
        .toString();
  }
}

class PairingInitResponsePolicyBuilder
    implements
        Builder<PairingInitResponsePolicy, PairingInitResponsePolicyBuilder> {
  _$PairingInitResponsePolicy? _$v;

  int? _deviceLimitRemaining;
  int? get deviceLimitRemaining => _$this._deviceLimitRemaining;
  set deviceLimitRemaining(int? deviceLimitRemaining) =>
      _$this._deviceLimitRemaining = deviceLimitRemaining;

  PairingInitResponsePolicyBuilder() {
    PairingInitResponsePolicy._defaults(this);
  }

  PairingInitResponsePolicyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceLimitRemaining = $v.deviceLimitRemaining;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PairingInitResponsePolicy other) {
    _$v = other as _$PairingInitResponsePolicy;
  }

  @override
  void update(void Function(PairingInitResponsePolicyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PairingInitResponsePolicy build() => _build();

  _$PairingInitResponsePolicy _build() {
    final _$result = _$v ??
        _$PairingInitResponsePolicy._(
          deviceLimitRemaining: deviceLimitRemaining,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
