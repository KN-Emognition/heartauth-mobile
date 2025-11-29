// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeviceInfo extends DeviceInfo {
  @override
  final String deviceId;
  @override
  final String displayName;
  @override
  final String publicKey;
  @override
  final String fcmToken;
  @override
  final int createdAt;

  factory _$DeviceInfo([void Function(DeviceInfoBuilder)? updates]) =>
      (new DeviceInfoBuilder()..update(updates))._build();

  _$DeviceInfo._(
      {required this.deviceId,
      required this.displayName,
      required this.publicKey,
      required this.fcmToken,
      required this.createdAt})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(deviceId, r'DeviceInfo', 'deviceId');
    BuiltValueNullFieldError.checkNotNull(
        displayName, r'DeviceInfo', 'displayName');
    BuiltValueNullFieldError.checkNotNull(
        publicKey, r'DeviceInfo', 'publicKey');
    BuiltValueNullFieldError.checkNotNull(fcmToken, r'DeviceInfo', 'fcmToken');
    BuiltValueNullFieldError.checkNotNull(
        createdAt, r'DeviceInfo', 'createdAt');
  }

  @override
  DeviceInfo rebuild(void Function(DeviceInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceInfoBuilder toBuilder() => new DeviceInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceInfo &&
        deviceId == other.deviceId &&
        displayName == other.displayName &&
        publicKey == other.publicKey &&
        fcmToken == other.fcmToken &&
        createdAt == other.createdAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, publicKey.hashCode);
    _$hash = $jc(_$hash, fcmToken.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeviceInfo')
          ..add('deviceId', deviceId)
          ..add('displayName', displayName)
          ..add('publicKey', publicKey)
          ..add('fcmToken', fcmToken)
          ..add('createdAt', createdAt))
        .toString();
  }
}

class DeviceInfoBuilder implements Builder<DeviceInfo, DeviceInfoBuilder> {
  _$DeviceInfo? _$v;

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

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  DeviceInfoBuilder() {
    DeviceInfo._defaults(this);
  }

  DeviceInfoBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceId = $v.deviceId;
      _displayName = $v.displayName;
      _publicKey = $v.publicKey;
      _fcmToken = $v.fcmToken;
      _createdAt = $v.createdAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeviceInfo other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DeviceInfo;
  }

  @override
  void update(void Function(DeviceInfoBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeviceInfo build() => _build();

  _$DeviceInfo _build() {
    final _$result = _$v ??
        new _$DeviceInfo._(
            deviceId: BuiltValueNullFieldError.checkNotNull(
                deviceId, r'DeviceInfo', 'deviceId'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'DeviceInfo', 'displayName'),
            publicKey: BuiltValueNullFieldError.checkNotNull(
                publicKey, r'DeviceInfo', 'publicKey'),
            fcmToken: BuiltValueNullFieldError.checkNotNull(
                fcmToken, r'DeviceInfo', 'fcmToken'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'DeviceInfo', 'createdAt'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
