// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$StatusResponse extends StatusResponse {
  @override
  final FlowStatus status;
  @override
  final String? reason;

  factory _$StatusResponse([void Function(StatusResponseBuilder)? updates]) =>
      (StatusResponseBuilder()..update(updates))._build();

  _$StatusResponse._({required this.status, this.reason}) : super._();
  @override
  StatusResponse rebuild(void Function(StatusResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusResponseBuilder toBuilder() => StatusResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StatusResponse &&
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
    return (newBuiltValueToStringHelper(r'StatusResponse')
          ..add('status', status)
          ..add('reason', reason))
        .toString();
  }
}

class StatusResponseBuilder
    implements Builder<StatusResponse, StatusResponseBuilder> {
  _$StatusResponse? _$v;

  FlowStatus? _status;
  FlowStatus? get status => _$this._status;
  set status(FlowStatus? status) => _$this._status = status;

  String? _reason;
  String? get reason => _$this._reason;
  set reason(String? reason) => _$this._reason = reason;

  StatusResponseBuilder() {
    StatusResponse._defaults(this);
  }

  StatusResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _reason = $v.reason;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StatusResponse other) {
    _$v = other as _$StatusResponse;
  }

  @override
  void update(void Function(StatusResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  StatusResponse build() => _build();

  _$StatusResponse _build() {
    final _$result = _$v ??
        _$StatusResponse._(
          status: BuiltValueNullFieldError.checkNotNull(
              status, r'StatusResponse', 'status'),
          reason: reason,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
