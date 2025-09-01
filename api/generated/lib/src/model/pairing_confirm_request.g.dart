// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pairing_confirm_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const PairingConfirmRequestAlgEnum _$pairingConfirmRequestAlgEnum_eS256 =
    const PairingConfirmRequestAlgEnum._('eS256');

PairingConfirmRequestAlgEnum _$pairingConfirmRequestAlgEnumValueOf(
    String name) {
  switch (name) {
    case 'eS256':
      return _$pairingConfirmRequestAlgEnum_eS256;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<PairingConfirmRequestAlgEnum>
    _$pairingConfirmRequestAlgEnumValues =
    BuiltSet<PairingConfirmRequestAlgEnum>(const <PairingConfirmRequestAlgEnum>[
  _$pairingConfirmRequestAlgEnum_eS256,
]);

Serializer<PairingConfirmRequestAlgEnum>
    _$pairingConfirmRequestAlgEnumSerializer =
    _$PairingConfirmRequestAlgEnumSerializer();

class _$PairingConfirmRequestAlgEnumSerializer
    implements PrimitiveSerializer<PairingConfirmRequestAlgEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'eS256': 'ES256',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'ES256': 'eS256',
  };

  @override
  final Iterable<Type> types = const <Type>[PairingConfirmRequestAlgEnum];
  @override
  final String wireName = 'PairingConfirmRequestAlgEnum';

  @override
  Object serialize(Serializers serializers, PairingConfirmRequestAlgEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  PairingConfirmRequestAlgEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      PairingConfirmRequestAlgEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$PairingConfirmRequest extends PairingConfirmRequest {
  @override
  final String jti;
  @override
  final String deviceId;
  @override
  final String signature;
  @override
  final PairingConfirmRequestAlgEnum alg;
  @override
  final String? dpop;

  factory _$PairingConfirmRequest(
          [void Function(PairingConfirmRequestBuilder)? updates]) =>
      (PairingConfirmRequestBuilder()..update(updates))._build();

  _$PairingConfirmRequest._(
      {required this.jti,
      required this.deviceId,
      required this.signature,
      required this.alg,
      this.dpop})
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
        jti == other.jti &&
        deviceId == other.deviceId &&
        signature == other.signature &&
        alg == other.alg &&
        dpop == other.dpop;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, jti.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, signature.hashCode);
    _$hash = $jc(_$hash, alg.hashCode);
    _$hash = $jc(_$hash, dpop.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PairingConfirmRequest')
          ..add('jti', jti)
          ..add('deviceId', deviceId)
          ..add('signature', signature)
          ..add('alg', alg)
          ..add('dpop', dpop))
        .toString();
  }
}

class PairingConfirmRequestBuilder
    implements Builder<PairingConfirmRequest, PairingConfirmRequestBuilder> {
  _$PairingConfirmRequest? _$v;

  String? _jti;
  String? get jti => _$this._jti;
  set jti(String? jti) => _$this._jti = jti;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  PairingConfirmRequestAlgEnum? _alg;
  PairingConfirmRequestAlgEnum? get alg => _$this._alg;
  set alg(PairingConfirmRequestAlgEnum? alg) => _$this._alg = alg;

  String? _dpop;
  String? get dpop => _$this._dpop;
  set dpop(String? dpop) => _$this._dpop = dpop;

  PairingConfirmRequestBuilder() {
    PairingConfirmRequest._defaults(this);
  }

  PairingConfirmRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _jti = $v.jti;
      _deviceId = $v.deviceId;
      _signature = $v.signature;
      _alg = $v.alg;
      _dpop = $v.dpop;
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
          jti: BuiltValueNullFieldError.checkNotNull(
              jti, r'PairingConfirmRequest', 'jti'),
          deviceId: BuiltValueNullFieldError.checkNotNull(
              deviceId, r'PairingConfirmRequest', 'deviceId'),
          signature: BuiltValueNullFieldError.checkNotNull(
              signature, r'PairingConfirmRequest', 'signature'),
          alg: BuiltValueNullFieldError.checkNotNull(
              alg, r'PairingConfirmRequest', 'alg'),
          dpop: dpop,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
