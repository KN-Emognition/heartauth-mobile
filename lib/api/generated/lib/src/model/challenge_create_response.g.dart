// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_create_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChallengeCreateResponse extends ChallengeCreateResponse {
  @override
  final String challengeId;
  @override
  final String deviceId;
  @override
  final String nonce;
  @override
  final int exp;

  factory _$ChallengeCreateResponse(
          [void Function(ChallengeCreateResponseBuilder)? updates]) =>
      (ChallengeCreateResponseBuilder()..update(updates))._build();

  _$ChallengeCreateResponse._(
      {required this.challengeId,
      required this.deviceId,
      required this.nonce,
      required this.exp})
      : super._();
  @override
  ChallengeCreateResponse rebuild(
          void Function(ChallengeCreateResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChallengeCreateResponseBuilder toBuilder() =>
      ChallengeCreateResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChallengeCreateResponse &&
        challengeId == other.challengeId &&
        deviceId == other.deviceId &&
        nonce == other.nonce &&
        exp == other.exp;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, challengeId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, nonce.hashCode);
    _$hash = $jc(_$hash, exp.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChallengeCreateResponse')
          ..add('challengeId', challengeId)
          ..add('deviceId', deviceId)
          ..add('nonce', nonce)
          ..add('exp', exp))
        .toString();
  }
}

class ChallengeCreateResponseBuilder
    implements
        Builder<ChallengeCreateResponse, ChallengeCreateResponseBuilder> {
  _$ChallengeCreateResponse? _$v;

  String? _challengeId;
  String? get challengeId => _$this._challengeId;
  set challengeId(String? challengeId) => _$this._challengeId = challengeId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _nonce;
  String? get nonce => _$this._nonce;
  set nonce(String? nonce) => _$this._nonce = nonce;

  int? _exp;
  int? get exp => _$this._exp;
  set exp(int? exp) => _$this._exp = exp;

  ChallengeCreateResponseBuilder() {
    ChallengeCreateResponse._defaults(this);
  }

  ChallengeCreateResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _challengeId = $v.challengeId;
      _deviceId = $v.deviceId;
      _nonce = $v.nonce;
      _exp = $v.exp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChallengeCreateResponse other) {
    _$v = other as _$ChallengeCreateResponse;
  }

  @override
  void update(void Function(ChallengeCreateResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChallengeCreateResponse build() => _build();

  _$ChallengeCreateResponse _build() {
    final _$result = _$v ??
        _$ChallengeCreateResponse._(
          challengeId: BuiltValueNullFieldError.checkNotNull(
              challengeId, r'ChallengeCreateResponse', 'challengeId'),
          deviceId: BuiltValueNullFieldError.checkNotNull(
              deviceId, r'ChallengeCreateResponse', 'deviceId'),
          nonce: BuiltValueNullFieldError.checkNotNull(
              nonce, r'ChallengeCreateResponse', 'nonce'),
          exp: BuiltValueNullFieldError.checkNotNull(
              exp, r'ChallengeCreateResponse', 'exp'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
