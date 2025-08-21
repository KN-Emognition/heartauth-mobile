// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_complete_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChallengeCompleteRequest extends ChallengeCompleteRequest {
  @override
  final String assertionJwt;
  @override
  final num? matchScore;
  @override
  final bool? biometricPassed;

  factory _$ChallengeCompleteRequest(
          [void Function(ChallengeCompleteRequestBuilder)? updates]) =>
      (ChallengeCompleteRequestBuilder()..update(updates))._build();

  _$ChallengeCompleteRequest._(
      {required this.assertionJwt, this.matchScore, this.biometricPassed})
      : super._();
  @override
  ChallengeCompleteRequest rebuild(
          void Function(ChallengeCompleteRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChallengeCompleteRequestBuilder toBuilder() =>
      ChallengeCompleteRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChallengeCompleteRequest &&
        assertionJwt == other.assertionJwt &&
        matchScore == other.matchScore &&
        biometricPassed == other.biometricPassed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assertionJwt.hashCode);
    _$hash = $jc(_$hash, matchScore.hashCode);
    _$hash = $jc(_$hash, biometricPassed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChallengeCompleteRequest')
          ..add('assertionJwt', assertionJwt)
          ..add('matchScore', matchScore)
          ..add('biometricPassed', biometricPassed))
        .toString();
  }
}

class ChallengeCompleteRequestBuilder
    implements
        Builder<ChallengeCompleteRequest, ChallengeCompleteRequestBuilder> {
  _$ChallengeCompleteRequest? _$v;

  String? _assertionJwt;
  String? get assertionJwt => _$this._assertionJwt;
  set assertionJwt(String? assertionJwt) => _$this._assertionJwt = assertionJwt;

  num? _matchScore;
  num? get matchScore => _$this._matchScore;
  set matchScore(num? matchScore) => _$this._matchScore = matchScore;

  bool? _biometricPassed;
  bool? get biometricPassed => _$this._biometricPassed;
  set biometricPassed(bool? biometricPassed) =>
      _$this._biometricPassed = biometricPassed;

  ChallengeCompleteRequestBuilder() {
    ChallengeCompleteRequest._defaults(this);
  }

  ChallengeCompleteRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assertionJwt = $v.assertionJwt;
      _matchScore = $v.matchScore;
      _biometricPassed = $v.biometricPassed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChallengeCompleteRequest other) {
    _$v = other as _$ChallengeCompleteRequest;
  }

  @override
  void update(void Function(ChallengeCompleteRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChallengeCompleteRequest build() => _build();

  _$ChallengeCompleteRequest _build() {
    final _$result = _$v ??
        _$ChallengeCompleteRequest._(
          assertionJwt: BuiltValueNullFieldError.checkNotNull(
              assertionJwt, r'ChallengeCompleteRequest', 'assertionJwt'),
          matchScore: matchScore,
          biometricPassed: biometricPassed,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
