// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_init_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PairingInitResponse extends PairingInitResponse {
  @override
  final String jti;
  @override
  final String nonce;
  @override
  final int exp;
  @override
  final PairingInitResponsePolicy? policy;

  factory _$PairingInitResponse(
          [void Function(PairingInitResponseBuilder)? updates]) =>
      (PairingInitResponseBuilder()..update(updates))._build();

  _$PairingInitResponse._(
      {required this.jti, required this.nonce, required this.exp, this.policy})
      : super._();
  @override
  PairingInitResponse rebuild(
          void Function(PairingInitResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PairingInitResponseBuilder toBuilder() =>
      PairingInitResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PairingInitResponse &&
        jti == other.jti &&
        nonce == other.nonce &&
        exp == other.exp &&
        policy == other.policy;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, jti.hashCode);
    _$hash = $jc(_$hash, nonce.hashCode);
    _$hash = $jc(_$hash, exp.hashCode);
    _$hash = $jc(_$hash, policy.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PairingInitResponse')
          ..add('jti', jti)
          ..add('nonce', nonce)
          ..add('exp', exp)
          ..add('policy', policy))
        .toString();
  }
}

class PairingInitResponseBuilder
    implements Builder<PairingInitResponse, PairingInitResponseBuilder> {
  _$PairingInitResponse? _$v;

  String? _jti;
  String? get jti => _$this._jti;
  set jti(String? jti) => _$this._jti = jti;

  String? _nonce;
  String? get nonce => _$this._nonce;
  set nonce(String? nonce) => _$this._nonce = nonce;

  int? _exp;
  int? get exp => _$this._exp;
  set exp(int? exp) => _$this._exp = exp;

  PairingInitResponsePolicyBuilder? _policy;
  PairingInitResponsePolicyBuilder get policy =>
      _$this._policy ??= PairingInitResponsePolicyBuilder();
  set policy(PairingInitResponsePolicyBuilder? policy) =>
      _$this._policy = policy;

  PairingInitResponseBuilder() {
    PairingInitResponse._defaults(this);
  }

  PairingInitResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jti = $v.jti;
      _nonce = $v.nonce;
      _exp = $v.exp;
      _policy = $v.policy?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PairingInitResponse other) {
    _$v = other as _$PairingInitResponse;
  }

  @override
  void update(void Function(PairingInitResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PairingInitResponse build() => _build();

  _$PairingInitResponse _build() {
    _$PairingInitResponse _$result;
    try {
      _$result = _$v ??
          _$PairingInitResponse._(
            jti: BuiltValueNullFieldError.checkNotNull(
                jti, r'PairingInitResponse', 'jti'),
            nonce: BuiltValueNullFieldError.checkNotNull(
                nonce, r'PairingInitResponse', 'nonce'),
            exp: BuiltValueNullFieldError.checkNotNull(
                exp, r'PairingInitResponse', 'exp'),
            policy: _policy?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'policy';
        _policy?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PairingInitResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
