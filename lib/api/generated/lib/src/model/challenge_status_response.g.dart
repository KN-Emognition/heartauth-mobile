// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_status_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ChallengeStatusResponseStateEnum
    _$challengeStatusResponseStateEnum_pending =
    const ChallengeStatusResponseStateEnum._('pending');
const ChallengeStatusResponseStateEnum
    _$challengeStatusResponseStateEnum_approved =
    const ChallengeStatusResponseStateEnum._('approved');
const ChallengeStatusResponseStateEnum
    _$challengeStatusResponseStateEnum_denied =
    const ChallengeStatusResponseStateEnum._('denied');
const ChallengeStatusResponseStateEnum
    _$challengeStatusResponseStateEnum_expired =
    const ChallengeStatusResponseStateEnum._('expired');

ChallengeStatusResponseStateEnum _$challengeStatusResponseStateEnumValueOf(
    String name) {
  switch (name) {
    case 'pending':
      return _$challengeStatusResponseStateEnum_pending;
    case 'approved':
      return _$challengeStatusResponseStateEnum_approved;
    case 'denied':
      return _$challengeStatusResponseStateEnum_denied;
    case 'expired':
      return _$challengeStatusResponseStateEnum_expired;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ChallengeStatusResponseStateEnum>
    _$challengeStatusResponseStateEnumValues = BuiltSet<
        ChallengeStatusResponseStateEnum>(const <ChallengeStatusResponseStateEnum>[
  _$challengeStatusResponseStateEnum_pending,
  _$challengeStatusResponseStateEnum_approved,
  _$challengeStatusResponseStateEnum_denied,
  _$challengeStatusResponseStateEnum_expired,
]);

const ChallengeStatusResponseReasonEnum
    _$challengeStatusResponseReasonEnum_lowScore =
    const ChallengeStatusResponseReasonEnum._('lowScore');
const ChallengeStatusResponseReasonEnum
    _$challengeStatusResponseReasonEnum_userCancelled =
    const ChallengeStatusResponseReasonEnum._('userCancelled');
const ChallengeStatusResponseReasonEnum
    _$challengeStatusResponseReasonEnum_timeout =
    const ChallengeStatusResponseReasonEnum._('timeout');
const ChallengeStatusResponseReasonEnum
    _$challengeStatusResponseReasonEnum_policy =
    const ChallengeStatusResponseReasonEnum._('policy');

ChallengeStatusResponseReasonEnum _$challengeStatusResponseReasonEnumValueOf(
    String name) {
  switch (name) {
    case 'lowScore':
      return _$challengeStatusResponseReasonEnum_lowScore;
    case 'userCancelled':
      return _$challengeStatusResponseReasonEnum_userCancelled;
    case 'timeout':
      return _$challengeStatusResponseReasonEnum_timeout;
    case 'policy':
      return _$challengeStatusResponseReasonEnum_policy;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ChallengeStatusResponseReasonEnum>
    _$challengeStatusResponseReasonEnumValues = BuiltSet<
        ChallengeStatusResponseReasonEnum>(const <ChallengeStatusResponseReasonEnum>[
  _$challengeStatusResponseReasonEnum_lowScore,
  _$challengeStatusResponseReasonEnum_userCancelled,
  _$challengeStatusResponseReasonEnum_timeout,
  _$challengeStatusResponseReasonEnum_policy,
]);

Serializer<ChallengeStatusResponseStateEnum>
    _$challengeStatusResponseStateEnumSerializer =
    _$ChallengeStatusResponseStateEnumSerializer();
Serializer<ChallengeStatusResponseReasonEnum>
    _$challengeStatusResponseReasonEnumSerializer =
    _$ChallengeStatusResponseReasonEnumSerializer();

class _$ChallengeStatusResponseStateEnumSerializer
    implements PrimitiveSerializer<ChallengeStatusResponseStateEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'approved': 'approved',
    'denied': 'denied',
    'expired': 'expired',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'approved': 'approved',
    'denied': 'denied',
    'expired': 'expired',
  };

  @override
  final Iterable<Type> types = const <Type>[ChallengeStatusResponseStateEnum];
  @override
  final String wireName = 'ChallengeStatusResponseStateEnum';

  @override
  Object serialize(
          Serializers serializers, ChallengeStatusResponseStateEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ChallengeStatusResponseStateEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ChallengeStatusResponseStateEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ChallengeStatusResponseReasonEnumSerializer
    implements PrimitiveSerializer<ChallengeStatusResponseReasonEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'lowScore': 'low_score',
    'userCancelled': 'user_cancelled',
    'timeout': 'timeout',
    'policy': 'policy',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'low_score': 'lowScore',
    'user_cancelled': 'userCancelled',
    'timeout': 'timeout',
    'policy': 'policy',
  };

  @override
  final Iterable<Type> types = const <Type>[ChallengeStatusResponseReasonEnum];
  @override
  final String wireName = 'ChallengeStatusResponseReasonEnum';

  @override
  Object serialize(
          Serializers serializers, ChallengeStatusResponseReasonEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ChallengeStatusResponseReasonEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ChallengeStatusResponseReasonEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ChallengeStatusResponse extends ChallengeStatusResponse {
  @override
  final ChallengeStatusResponseStateEnum state;
  @override
  final ChallengeStatusResponseReasonEnum? reason;

  factory _$ChallengeStatusResponse(
          [void Function(ChallengeStatusResponseBuilder)? updates]) =>
      (ChallengeStatusResponseBuilder()..update(updates))._build();

  _$ChallengeStatusResponse._({required this.state, this.reason}) : super._();
  @override
  ChallengeStatusResponse rebuild(
          void Function(ChallengeStatusResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChallengeStatusResponseBuilder toBuilder() =>
      ChallengeStatusResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChallengeStatusResponse &&
        state == other.state &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, state.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChallengeStatusResponse')
          ..add('state', state)
          ..add('reason', reason))
        .toString();
  }
}

class ChallengeStatusResponseBuilder
    implements
        Builder<ChallengeStatusResponse, ChallengeStatusResponseBuilder> {
  _$ChallengeStatusResponse? _$v;

  ChallengeStatusResponseStateEnum? _state;
  ChallengeStatusResponseStateEnum? get state => _$this._state;
  set state(ChallengeStatusResponseStateEnum? state) => _$this._state = state;

  ChallengeStatusResponseReasonEnum? _reason;
  ChallengeStatusResponseReasonEnum? get reason => _$this._reason;
  set reason(ChallengeStatusResponseReasonEnum? reason) =>
      _$this._reason = reason;

  ChallengeStatusResponseBuilder() {
    ChallengeStatusResponse._defaults(this);
  }

  ChallengeStatusResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _state = $v.state;
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChallengeStatusResponse other) {
    _$v = other as _$ChallengeStatusResponse;
  }

  @override
  void update(void Function(ChallengeStatusResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChallengeStatusResponse build() => _build();

  _$ChallengeStatusResponse _build() {
    final _$result = _$v ??
        _$ChallengeStatusResponse._(
          state: BuiltValueNullFieldError.checkNotNull(
              state, r'ChallengeStatusResponse', 'state'),
          reason: reason,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
