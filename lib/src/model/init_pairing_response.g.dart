// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_pairing_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitPairingResponse extends InitPairingResponse {
  @override
  final String nonce;
  @override
  final int expiresAt;
  @override
  final String username;

  factory _$InitPairingResponse(
          [void Function(InitPairingResponseBuilder)? updates]) =>
      (new InitPairingResponseBuilder()..update(updates))._build();

  _$InitPairingResponse._(
      {required this.nonce, required this.expiresAt, required this.username})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        nonce, r'InitPairingResponse', 'nonce');
    BuiltValueNullFieldError.checkNotNull(
        expiresAt, r'InitPairingResponse', 'expiresAt');
    BuiltValueNullFieldError.checkNotNull(
        username, r'InitPairingResponse', 'username');
  }

  @override
  InitPairingResponse rebuild(
          void Function(InitPairingResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitPairingResponseBuilder toBuilder() =>
      new InitPairingResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitPairingResponse &&
        nonce == other.nonce &&
        expiresAt == other.expiresAt &&
        username == other.username;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, nonce.hashCode);
    _$hash = $jc(_$hash, expiresAt.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitPairingResponse')
          ..add('nonce', nonce)
          ..add('expiresAt', expiresAt)
          ..add('username', username))
        .toString();
  }
}

class InitPairingResponseBuilder
    implements Builder<InitPairingResponse, InitPairingResponseBuilder> {
  _$InitPairingResponse? _$v;

  String? _nonce;
  String? get nonce => _$this._nonce;
  set nonce(String? nonce) => _$this._nonce = nonce;

  int? _expiresAt;
  int? get expiresAt => _$this._expiresAt;
  set expiresAt(int? expiresAt) => _$this._expiresAt = expiresAt;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  InitPairingResponseBuilder() {
    InitPairingResponse._defaults(this);
  }

  InitPairingResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nonce = $v.nonce;
      _expiresAt = $v.expiresAt;
      _username = $v.username;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitPairingResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitPairingResponse;
  }

  @override
  void update(void Function(InitPairingResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitPairingResponse build() => _build();

  _$InitPairingResponse _build() {
    final _$result = _$v ??
        new _$InitPairingResponse._(
            nonce: BuiltValueNullFieldError.checkNotNull(
                nonce, r'InitPairingResponse', 'nonce'),
            expiresAt: BuiltValueNullFieldError.checkNotNull(
                expiresAt, r'InitPairingResponse', 'expiresAt'),
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'InitPairingResponse', 'username'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
