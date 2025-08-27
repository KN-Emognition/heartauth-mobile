// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_credential.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DeviceCredential extends DeviceCredential {
  @override
  final String deviceId;
  @override
  final String displayName;
  @override
  final String publicKeyPem;
  @override
  final String fcmToken;
  @override
  final int createdAt;
  @override
  final Attestation? attestation;

  factory _$DeviceCredential(
          [void Function(DeviceCredentialBuilder)? updates]) =>
      (DeviceCredentialBuilder()..update(updates))._build();

  _$DeviceCredential._(
      {required this.deviceId,
      required this.displayName,
      required this.publicKeyPem,
      required this.fcmToken,
      required this.createdAt,
      this.attestation})
      : super._();
  @override
  DeviceCredential rebuild(void Function(DeviceCredentialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DeviceCredentialBuilder toBuilder() =>
      DeviceCredentialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DeviceCredential &&
        deviceId == other.deviceId &&
        displayName == other.displayName &&
        publicKeyPem == other.publicKeyPem &&
        fcmToken == other.fcmToken &&
        createdAt == other.createdAt &&
        attestation == other.attestation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, publicKeyPem.hashCode);
    _$hash = $jc(_$hash, fcmToken.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, attestation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DeviceCredential')
          ..add('deviceId', deviceId)
          ..add('displayName', displayName)
          ..add('publicKeyPem', publicKeyPem)
          ..add('fcmToken', fcmToken)
          ..add('createdAt', createdAt)
          ..add('attestation', attestation))
        .toString();
  }
}

class DeviceCredentialBuilder
    implements Builder<DeviceCredential, DeviceCredentialBuilder> {
  _$DeviceCredential? _$v;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _publicKeyPem;
  String? get publicKeyPem => _$this._publicKeyPem;
  set publicKeyPem(String? publicKeyPem) => _$this._publicKeyPem = publicKeyPem;

  String? _fcmToken;
  String? get fcmToken => _$this._fcmToken;
  set fcmToken(String? fcmToken) => _$this._fcmToken = fcmToken;

  int? _createdAt;
  int? get createdAt => _$this._createdAt;
  set createdAt(int? createdAt) => _$this._createdAt = createdAt;

  AttestationBuilder? _attestation;
  AttestationBuilder get attestation =>
      _$this._attestation ??= AttestationBuilder();
  set attestation(AttestationBuilder? attestation) =>
      _$this._attestation = attestation;

  DeviceCredentialBuilder() {
    DeviceCredential._defaults(this);
  }

  DeviceCredentialBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceId = $v.deviceId;
      _displayName = $v.displayName;
      _publicKeyPem = $v.publicKeyPem;
      _fcmToken = $v.fcmToken;
      _createdAt = $v.createdAt;
      _attestation = $v.attestation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DeviceCredential other) {
    _$v = other as _$DeviceCredential;
  }

  @override
  void update(void Function(DeviceCredentialBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DeviceCredential build() => _build();

  _$DeviceCredential _build() {
    _$DeviceCredential _$result;
    try {
      _$result = _$v ??
          _$DeviceCredential._(
            deviceId: BuiltValueNullFieldError.checkNotNull(
                deviceId, r'DeviceCredential', 'deviceId'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'DeviceCredential', 'displayName'),
            publicKeyPem: BuiltValueNullFieldError.checkNotNull(
                publicKeyPem, r'DeviceCredential', 'publicKeyPem'),
            fcmToken: BuiltValueNullFieldError.checkNotNull(
                fcmToken, r'DeviceCredential', 'fcmToken'),
            createdAt: BuiltValueNullFieldError.checkNotNull(
                createdAt, r'DeviceCredential', 'createdAt'),
            attestation: _attestation?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'attestation';
        _attestation?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'DeviceCredential', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
