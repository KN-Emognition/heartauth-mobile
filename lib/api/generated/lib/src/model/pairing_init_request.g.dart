// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_init_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PairingInitRequestPlatformEnum _$pairingInitRequestPlatformEnum_ANDROID =
    const PairingInitRequestPlatformEnum._('ANDROID');
const PairingInitRequestPlatformEnum _$pairingInitRequestPlatformEnum_IOS =
    const PairingInitRequestPlatformEnum._('IOS');

PairingInitRequestPlatformEnum _$pairingInitRequestPlatformEnumValueOf(
    String name) {
  switch (name) {
    case 'ANDROID':
      return _$pairingInitRequestPlatformEnum_ANDROID;
    case 'IOS':
      return _$pairingInitRequestPlatformEnum_IOS;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PairingInitRequestPlatformEnum>
    _$pairingInitRequestPlatformEnumValues = BuiltSet<
        PairingInitRequestPlatformEnum>(const <PairingInitRequestPlatformEnum>[
  _$pairingInitRequestPlatformEnum_ANDROID,
  _$pairingInitRequestPlatformEnum_IOS,
]);

Serializer<PairingInitRequestPlatformEnum>
    _$pairingInitRequestPlatformEnumSerializer =
    _$PairingInitRequestPlatformEnumSerializer();

class _$PairingInitRequestPlatformEnumSerializer
    implements PrimitiveSerializer<PairingInitRequestPlatformEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'ANDROID': 'ANDROID',
    'IOS': 'IOS',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ANDROID': 'ANDROID',
    'IOS': 'IOS',
  };

  @override
  final Iterable<Type> types = const <Type>[PairingInitRequestPlatformEnum];
  @override
  final String wireName = 'PairingInitRequestPlatformEnum';

  @override
  Object serialize(
          Serializers serializers, PairingInitRequestPlatformEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PairingInitRequestPlatformEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PairingInitRequestPlatformEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$PairingInitRequest extends PairingInitRequest {
  @override
  final String deviceId;
  @override
  final String displayName;
  @override
  final String publicKeyPem;
  @override
  final String fcmToken;
  @override
  final PairingInitRequestPlatformEnum platform;
  @override
  final String? osVersion;
  @override
  final String? model;
  @override
  final Attestation? attestation;

  factory _$PairingInitRequest(
          [void Function(PairingInitRequestBuilder)? updates]) =>
      (PairingInitRequestBuilder()..update(updates))._build();

  _$PairingInitRequest._(
      {required this.deviceId,
      required this.displayName,
      required this.publicKeyPem,
      required this.fcmToken,
      required this.platform,
      this.osVersion,
      this.model,
      this.attestation})
      : super._();
  @override
  PairingInitRequest rebuild(
          void Function(PairingInitRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PairingInitRequestBuilder toBuilder() =>
      PairingInitRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PairingInitRequest &&
        deviceId == other.deviceId &&
        displayName == other.displayName &&
        publicKeyPem == other.publicKeyPem &&
        fcmToken == other.fcmToken &&
        platform == other.platform &&
        osVersion == other.osVersion &&
        model == other.model &&
        attestation == other.attestation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, publicKeyPem.hashCode);
    _$hash = $jc(_$hash, fcmToken.hashCode);
    _$hash = $jc(_$hash, platform.hashCode);
    _$hash = $jc(_$hash, osVersion.hashCode);
    _$hash = $jc(_$hash, model.hashCode);
    _$hash = $jc(_$hash, attestation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PairingInitRequest')
          ..add('deviceId', deviceId)
          ..add('displayName', displayName)
          ..add('publicKeyPem', publicKeyPem)
          ..add('fcmToken', fcmToken)
          ..add('platform', platform)
          ..add('osVersion', osVersion)
          ..add('model', model)
          ..add('attestation', attestation))
        .toString();
  }
}

class PairingInitRequestBuilder
    implements Builder<PairingInitRequest, PairingInitRequestBuilder> {
  _$PairingInitRequest? _$v;

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

  PairingInitRequestPlatformEnum? _platform;
  PairingInitRequestPlatformEnum? get platform => _$this._platform;
  set platform(PairingInitRequestPlatformEnum? platform) =>
      _$this._platform = platform;

  String? _osVersion;
  String? get osVersion => _$this._osVersion;
  set osVersion(String? osVersion) => _$this._osVersion = osVersion;

  String? _model;
  String? get model => _$this._model;
  set model(String? model) => _$this._model = model;

  AttestationBuilder? _attestation;
  AttestationBuilder get attestation =>
      _$this._attestation ??= AttestationBuilder();
  set attestation(AttestationBuilder? attestation) =>
      _$this._attestation = attestation;

  PairingInitRequestBuilder() {
    PairingInitRequest._defaults(this);
  }

  PairingInitRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _deviceId = $v.deviceId;
      _displayName = $v.displayName;
      _publicKeyPem = $v.publicKeyPem;
      _fcmToken = $v.fcmToken;
      _platform = $v.platform;
      _osVersion = $v.osVersion;
      _model = $v.model;
      _attestation = $v.attestation?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PairingInitRequest other) {
    _$v = other as _$PairingInitRequest;
  }

  @override
  void update(void Function(PairingInitRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PairingInitRequest build() => _build();

  _$PairingInitRequest _build() {
    _$PairingInitRequest _$result;
    try {
      _$result = _$v ??
          _$PairingInitRequest._(
            deviceId: BuiltValueNullFieldError.checkNotNull(
                deviceId, r'PairingInitRequest', 'deviceId'),
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'PairingInitRequest', 'displayName'),
            publicKeyPem: BuiltValueNullFieldError.checkNotNull(
                publicKeyPem, r'PairingInitRequest', 'publicKeyPem'),
            fcmToken: BuiltValueNullFieldError.checkNotNull(
                fcmToken, r'PairingInitRequest', 'fcmToken'),
            platform: BuiltValueNullFieldError.checkNotNull(
                platform, r'PairingInitRequest', 'platform'),
            osVersion: osVersion,
            model: model,
            attestation: _attestation?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'attestation';
        _attestation?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'PairingInitRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
