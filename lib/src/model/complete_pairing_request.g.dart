// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_pairing_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CompletePairingRequest extends CompletePairingRequest {
  @override
  final String dataToken;
  @override
  final String signature;

  factory _$CompletePairingRequest(
          [void Function(CompletePairingRequestBuilder)? updates]) =>
      (new CompletePairingRequestBuilder()..update(updates))._build();

  _$CompletePairingRequest._({required this.dataToken, required this.signature})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        dataToken, r'CompletePairingRequest', 'dataToken');
    BuiltValueNullFieldError.checkNotNull(
        signature, r'CompletePairingRequest', 'signature');
  }

  @override
  CompletePairingRequest rebuild(
          void Function(CompletePairingRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CompletePairingRequestBuilder toBuilder() =>
      new CompletePairingRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CompletePairingRequest &&
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
    return (newBuiltValueToStringHelper(r'CompletePairingRequest')
          ..add('dataToken', dataToken)
          ..add('signature', signature))
        .toString();
  }
}

class CompletePairingRequestBuilder
    implements Builder<CompletePairingRequest, CompletePairingRequestBuilder> {
  _$CompletePairingRequest? _$v;

  String? _dataToken;
  String? get dataToken => _$this._dataToken;
  set dataToken(String? dataToken) => _$this._dataToken = dataToken;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  CompletePairingRequestBuilder() {
    CompletePairingRequest._defaults(this);
  }

  CompletePairingRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dataToken = $v.dataToken;
      _signature = $v.signature;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CompletePairingRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CompletePairingRequest;
  }

  @override
  void update(void Function(CompletePairingRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CompletePairingRequest build() => _build();

  _$CompletePairingRequest _build() {
    final _$result = _$v ??
        new _$CompletePairingRequest._(
            dataToken: BuiltValueNullFieldError.checkNotNull(
                dataToken, r'CompletePairingRequest', 'dataToken'),
            signature: BuiltValueNullFieldError.checkNotNull(
                signature, r'CompletePairingRequest', 'signature'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
