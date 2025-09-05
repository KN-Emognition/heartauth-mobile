// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flow_status.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const FlowStatus _$CREATED = const FlowStatus._('CREATED');
const FlowStatus _$PENDING = const FlowStatus._('PENDING');
const FlowStatus _$APPROVED = const FlowStatus._('APPROVED');
const FlowStatus _$DENIED = const FlowStatus._('DENIED');
const FlowStatus _$EXPIRED = const FlowStatus._('EXPIRED');
const FlowStatus _$NOT_FOUND = const FlowStatus._('NOT_FOUND');

FlowStatus _$valueOf(String name) {
  switch (name) {
    case 'CREATED':
      return _$CREATED;
    case 'PENDING':
      return _$PENDING;
    case 'APPROVED':
      return _$APPROVED;
    case 'DENIED':
      return _$DENIED;
    case 'EXPIRED':
      return _$EXPIRED;
    case 'NOT_FOUND':
      return _$NOT_FOUND;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<FlowStatus> _$values = BuiltSet<FlowStatus>(const <FlowStatus>[
  _$CREATED,
  _$PENDING,
  _$APPROVED,
  _$DENIED,
  _$EXPIRED,
  _$NOT_FOUND,
]);

class _$FlowStatusMeta {
  const _$FlowStatusMeta();
  FlowStatus get CREATED => _$CREATED;
  FlowStatus get PENDING => _$PENDING;
  FlowStatus get APPROVED => _$APPROVED;
  FlowStatus get DENIED => _$DENIED;
  FlowStatus get EXPIRED => _$EXPIRED;
  FlowStatus get NOT_FOUND => _$NOT_FOUND;
  FlowStatus valueOf(String name) => _$valueOf(name);
  BuiltSet<FlowStatus> get values => _$values;
}

abstract class _$FlowStatusMixin {
  // ignore: non_constant_identifier_names
  _$FlowStatusMeta get FlowStatus => const _$FlowStatusMeta();
}

Serializer<FlowStatus> _$flowStatusSerializer = _$FlowStatusSerializer();

class _$FlowStatusSerializer implements PrimitiveSerializer<FlowStatus> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'CREATED': 'CREATED',
    'PENDING': 'PENDING',
    'APPROVED': 'APPROVED',
    'DENIED': 'DENIED',
    'EXPIRED': 'EXPIRED',
    'NOT_FOUND': 'NOT_FOUND',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'CREATED': 'CREATED',
    'PENDING': 'PENDING',
    'APPROVED': 'APPROVED',
    'DENIED': 'DENIED',
    'EXPIRED': 'EXPIRED',
    'NOT_FOUND': 'NOT_FOUND',
  };

  @override
  final Iterable<Type> types = const <Type>[FlowStatus];
  @override
  final String wireName = 'FlowStatus';

  @override
  Object serialize(Serializers serializers, FlowStatus object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  FlowStatus deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      FlowStatus.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
