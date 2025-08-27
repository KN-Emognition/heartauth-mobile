//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'flow_status.g.dart';

class FlowStatus extends EnumClass {
  /// Lifecycle state of a challenge.
  @BuiltValueEnumConst(wireName: r'PENDING')
  static const FlowStatus PENDING = _$PENDING;

  /// Lifecycle state of a challenge.
  @BuiltValueEnumConst(wireName: r'APPROVED')
  static const FlowStatus APPROVED = _$APPROVED;

  /// Lifecycle state of a challenge.
  @BuiltValueEnumConst(wireName: r'DENIED')
  static const FlowStatus DENIED = _$DENIED;

  /// Lifecycle state of a challenge.
  @BuiltValueEnumConst(wireName: r'EXPIRED')
  static const FlowStatus EXPIRED = _$EXPIRED;

  /// Lifecycle state of a challenge.
  @BuiltValueEnumConst(wireName: r'NOT_FOUND')
  static const FlowStatus NOT_FOUND = _$NOT_FOUND;

  static Serializer<FlowStatus> get serializer => _$flowStatusSerializer;

  const FlowStatus._(String name) : super(name);

  static BuiltSet<FlowStatus> get values => _$values;
  static FlowStatus valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class FlowStatusMixin = Object with _$FlowStatusMixin;
