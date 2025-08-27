// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_complete_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChallengeCompleteRequest extends ChallengeCompleteRequest {
  @override
  final String assertionJwt;
  @override
  final String? anything;

  factory _$ChallengeCompleteRequest(
          [void Function(ChallengeCompleteRequestBuilder)? updates]) =>
      (ChallengeCompleteRequestBuilder()..update(updates))._build();

  _$ChallengeCompleteRequest._({required this.assertionJwt, this.anything})
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
        anything == other.anything;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, assertionJwt.hashCode);
    _$hash = $jc(_$hash, anything.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChallengeCompleteRequest')
          ..add('assertionJwt', assertionJwt)
          ..add('anything', anything))
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

  String? _anything;
  String? get anything => _$this._anything;
  set anything(String? anything) => _$this._anything = anything;

  ChallengeCompleteRequestBuilder() {
    ChallengeCompleteRequest._defaults(this);
  }

  ChallengeCompleteRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _assertionJwt = $v.assertionJwt;
      _anything = $v.anything;
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
          anything: anything,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
