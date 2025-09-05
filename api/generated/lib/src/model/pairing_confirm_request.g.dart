// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_confirm_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PairingConfirmRequest extends PairingConfirmRequest {
  @override
  final String deviceId;
  @override
  final String signature;
  @override
  final EncryptionAlgo alg;

  factory _$PairingConfirmRequest(
          [void Function(PairingConfirmRequestBuilder)? updates]) =>
      (PairingConfirmRequestBuilder()..update(updates))._build();

  _$PairingConfirmRequest._(
      {required this.deviceId, required this.signature, required this.alg})
      : super._();
  @override
  PairingConfirmRequest rebuild(
          void Function(PairingConfirmRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PairingConfirmRequestBuilder toBuilder() =>
      PairingConfirmRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PairingConfirmRequest &&
        deviceId == other.deviceId &&
        signature == other.signature &&
        alg == other.alg;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, signature.hashCode);
    _$hash = $jc(_$hash, alg.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PairingConfirmRequest')
          ..add('deviceId', deviceId)
          ..add('signature', signature)
          ..add('alg', alg))
        .toString();
  }
}

class PairingConfirmRequestBuilder
    implements Builder<PairingConfirmRequest, PairingConfirmRequestBuilder> {
  _$PairingConfirmRequest? _$v;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  EncryptionAlgo? _alg;
  EncryptionAlgo? get alg => _$this._alg;
  set alg(EncryptionAlgo? alg) => _$this._alg = alg;

  PairingConfirmRequestBuilder() {
    PairingConfirmRequest._defaults(this);
  }

  PairingConfirmRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceId = $v.deviceId;
      _signature = $v.signature;
      _alg = $v.alg;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PairingConfirmRequest other) {
    _$v = other as _$PairingConfirmRequest;
  }

  @override
  void update(void Function(PairingConfirmRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PairingConfirmRequest build() => _build();

  _$PairingConfirmRequest _build() {
    final _$result = _$v ??
        _$PairingConfirmRequest._(
          deviceId: BuiltValueNullFieldError.checkNotNull(
              deviceId, r'PairingConfirmRequest', 'deviceId'),
          signature: BuiltValueNullFieldError.checkNotNull(
              signature, r'PairingConfirmRequest', 'signature'),
          alg: BuiltValueNullFieldError.checkNotNull(
              alg, r'PairingConfirmRequest', 'alg'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
