// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_status_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

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

Serializer<ChallengeStatusResponseReasonEnum>
    _$challengeStatusResponseReasonEnumSerializer =
    _$ChallengeStatusResponseReasonEnumSerializer();

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
  final FlowStatus status;
  @override
  final ChallengeStatusResponseReasonEnum? reason;

  factory _$ChallengeStatusResponse(
          [void Function(ChallengeStatusResponseBuilder)? updates]) =>
      (ChallengeStatusResponseBuilder()..update(updates))._build();

  _$ChallengeStatusResponse._({required this.status, this.reason}) : super._();
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
        status == other.status &&
        reason == other.reason;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChallengeStatusResponse')
          ..add('status', status)
          ..add('reason', reason))
        .toString();
  }
}

class ChallengeStatusResponseBuilder
    implements
        Builder<ChallengeStatusResponse, ChallengeStatusResponseBuilder> {
  _$ChallengeStatusResponse? _$v;

  FlowStatus? _status;
  FlowStatus? get status => _$this._status;
  set status(FlowStatus? status) => _$this._status = status;

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
      _status = $v.status;
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
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'ChallengeStatusResponse', 'status'),
          reason: reason,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
