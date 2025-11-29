// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_pairing_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$InitPairingRequest extends InitPairingRequest {
  @override
  final String deviceId;
  @override
  final String displayName;
  @override
  final String publicKey;
  @override
  final String fcmToken;
  @override
  final Platform platform;
  @override
  final String? osVersion;
  @override
  final String? model;

  factory _$InitPairingRequest(
          [void Function(InitPairingRequestBuilder)? updates]) =>
      (new InitPairingRequestBuilder()..update(updates))._build();

  _$InitPairingRequest._(
      {required this.deviceId,
      required this.displayName,
      required this.publicKey,
      required this.fcmToken,
      required this.platform,
      this.osVersion,
      this.model})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        deviceId, r'InitPairingRequest', 'deviceId');
    BuiltValueNullFieldError.checkNotNull(
        displayName, r'InitPairingRequest', 'displayName');
    BuiltValueNullFieldError.checkNotNull(
        publicKey, r'InitPairingRequest', 'publicKey');
    BuiltValueNullFieldError.checkNotNull(
        fcmToken, r'InitPairingRequest', 'fcmToken');
    BuiltValueNullFieldError.checkNotNull(
        platform, r'InitPairingRequest', 'platform');
  }

  @override
  InitPairingRequest rebuild(
          void Function(InitPairingRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitPairingRequestBuilder toBuilder() =>
      new InitPairingRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InitPairingRequest &&
        deviceId == other.deviceId &&
        displayName == other.displayName &&
        publicKey == other.publicKey &&
        fcmToken == other.fcmToken &&
        platform == other.platform &&
        osVersion == other.osVersion &&
        model == other.model;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, publicKey.hashCode);
    _$hash = $jc(_$hash, fcmToken.hashCode);
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jc(_$hash, osVersion.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'InitPairingRequest')
          ..add('deviceId', deviceId)
          ..add('displayName', displayName)
          ..add('publicKey', publicKey)
          ..add('fcmToken', fcmToken)
          ..add('platform', platform)
          ..add('osVersion', osVersion)
          ..add('model', model))
        .toString();
  }
}

class InitPairingRequestBuilder
    implements Builder<InitPairingRequest, InitPairingRequestBuilder> {
  _$InitPairingRequest? _$v;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _publicKey;
  String? get publicKey => _$this._publicKey;
  set publicKey(String? publicKey) => _$this._publicKey = publicKey;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  Platform? _platform;
  Platform? get platform => _$this._platform;
  set platform(Platform? platform) => _$this._platform = platform;

  String? _osVersion;
  String? get osVersion => _$this._osVersion;
  set osVersion(String? osVersion) => _$this._osVersion = osVersion;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  InitPairingRequestBuilder() {
    InitPairingRequest._defaults(this);
  }

  InitPairingRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceId = $v.deviceId;
      _displayName = $v.displayName;
      _publicKey = $v.publicKey;
      _fcmToken = $v.fcmToken;
      _platform = $v.platform;
      _osVersion = $v.osVersion;
      _model = $v.model;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InitPairingRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InitPairingRequest;
  }

  @override
  void update(void Function(InitPairingRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  InitPairingRequest build() => _build();

  _$InitPairingRequest _build() {
    final _$result = _$v ??
        new _$InitPairingRequest._(
            deviceId: BuiltValueNullFieldError.checkNotNull(
                deviceId, r'InitPairingRequest', 'deviceId'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'InitPairingRequest', 'displayName'),
            publicKey: BuiltValueNullFieldError.checkNotNull(
                publicKey, r'InitPairingRequest', 'publicKey'),
            fcmToken: BuiltValueNullFieldError.checkNotNull(
                fcmToken, r'InitPairingRequest', 'fcmToken'),
            platform: BuiltValueNullFieldError.checkNotNull(
                platform, r'InitPairingRequest', 'platform'),
            osVersion: osVersion,
            model: model);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
