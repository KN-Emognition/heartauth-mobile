// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_init_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PairingInitResponse extends PairingInitResponse {
  @override
  final String nonce;

  factory _$PairingInitResponse(
          [void Function(PairingInitResponseBuilder)? updates]) =>
      (PairingInitResponseBuilder()..update(updates))._build();

  _$PairingInitResponse._({required this.nonce}) : super._();
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
    return other is PairingInitResponse && nonce == other.nonce;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, nonce.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PairingInitResponse')
          ..add('nonce', nonce))
        .toString();
  }
}

class PairingInitResponseBuilder
    implements Builder<PairingInitResponse, PairingInitResponseBuilder> {
  _$PairingInitResponse? _$v;

  String? _nonce;
  String? get nonce => _$this._nonce;
  set nonce(String? nonce) => _$this._nonce = nonce;

  PairingInitResponseBuilder() {
    PairingInitResponse._defaults(this);
  }

  PairingInitResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nonce = $v.nonce;
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
    final _$result = _$v ??
        _$PairingInitResponse._(
          nonce: BuiltValueNullFieldError.checkNotNull(
              nonce, r'PairingInitResponse', 'nonce'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
