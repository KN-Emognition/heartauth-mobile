// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_create_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ChallengeCreateRequest extends ChallengeCreateRequest {
  @override
  final String userId;
  @override
  final String? deviceId;
  @override
  final int? ttlSeconds;

  factory _$ChallengeCreateRequest(
          [void Function(ChallengeCreateRequestBuilder)? updates]) =>
      (ChallengeCreateRequestBuilder()..update(updates))._build();

  _$ChallengeCreateRequest._(
      {required this.userId, this.deviceId, this.ttlSeconds})
      : super._();
  @override
  ChallengeCreateRequest rebuild(
          void Function(ChallengeCreateRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChallengeCreateRequestBuilder toBuilder() =>
      ChallengeCreateRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChallengeCreateRequest &&
        userId == other.userId &&
        deviceId == other.deviceId &&
        ttlSeconds == other.ttlSeconds;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, deviceId.hashCode);
    _$hash = $jc(_$hash, ttlSeconds.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChallengeCreateRequest')
          ..add('userId', userId)
          ..add('deviceId', deviceId)
          ..add('ttlSeconds', ttlSeconds))
        .toString();
  }
}

class ChallengeCreateRequestBuilder
    implements Builder<ChallengeCreateRequest, ChallengeCreateRequestBuilder> {
  _$ChallengeCreateRequest? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  String? _deviceId;
  String? get deviceId => _$this._deviceId;
  set deviceId(String? deviceId) => _$this._deviceId = deviceId;

  int? _ttlSeconds;
  int? get ttlSeconds => _$this._ttlSeconds;
  set ttlSeconds(int? ttlSeconds) => _$this._ttlSeconds = ttlSeconds;

  ChallengeCreateRequestBuilder() {
    ChallengeCreateRequest._defaults(this);
  }

  ChallengeCreateRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _deviceId = $v.deviceId;
      _ttlSeconds = $v.ttlSeconds;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChallengeCreateRequest other) {
    _$v = other as _$ChallengeCreateRequest;
  }

  @override
  void update(void Function(ChallengeCreateRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChallengeCreateRequest build() => _build();

  _$ChallengeCreateRequest _build() {
    final _$result = _$v ??
        _$ChallengeCreateRequest._(
          userId: BuiltValueNullFieldError.checkNotNull(
              userId, r'ChallengeCreateRequest', 'userId'),
          deviceId: deviceId,
          ttlSeconds: ttlSeconds,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
