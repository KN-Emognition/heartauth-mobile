// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_challenge_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CompleteChallengeRequest extends CompleteChallengeRequest {
  @override
  final String dataToken;
  @override
  final String signature;

  factory _$CompleteChallengeRequest(
          [void Function(CompleteChallengeRequestBuilder)? updates]) =>
      (new CompleteChallengeRequestBuilder()..update(updates))._build();

  _$CompleteChallengeRequest._(
      {required this.dataToken, required this.signature})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        dataToken, r'CompleteChallengeRequest', 'dataToken');
    BuiltValueNullFieldError.checkNotNull(
        signature, r'CompleteChallengeRequest', 'signature');
  }

  @override
  CompleteChallengeRequest rebuild(
          void Function(CompleteChallengeRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompleteChallengeRequestBuilder toBuilder() =>
      new CompleteChallengeRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompleteChallengeRequest &&
        dataToken == other.dataToken &&
        signature == other.signature;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, dataToken.hashCode);
    _$hash = $jc(_$hash, signature.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CompleteChallengeRequest')
          ..add('dataToken', dataToken)
          ..add('signature', signature))
        .toString();
  }
}

class CompleteChallengeRequestBuilder
    implements
        Builder<CompleteChallengeRequest, CompleteChallengeRequestBuilder> {
  _$CompleteChallengeRequest? _$v;

  String? _dataToken;
  String? get dataToken => _$this._dataToken;
  set dataToken(String? dataToken) => _$this._dataToken = dataToken;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  CompleteChallengeRequestBuilder() {
    CompleteChallengeRequest._defaults(this);
  }

  CompleteChallengeRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dataToken = $v.dataToken;
      _signature = $v.signature;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompleteChallengeRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompleteChallengeRequest;
  }

  @override
  void update(void Function(CompleteChallengeRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompleteChallengeRequest build() => _build();

  _$CompleteChallengeRequest _build() {
    final _$result = _$v ??
        new _$CompleteChallengeRequest._(
            dataToken: BuiltValueNullFieldError.checkNotNull(
                dataToken, r'CompleteChallengeRequest', 'dataToken'),
            signature: BuiltValueNullFieldError.checkNotNull(
                signature, r'CompleteChallengeRequest', 'signature'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
