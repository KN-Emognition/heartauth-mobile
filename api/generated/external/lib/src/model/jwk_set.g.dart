// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwk_set.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$JwkSet extends JwkSet {
  @override
  final BuiltList<ECJwk> keys;

  factory _$JwkSet([void Function(JwkSetBuilder)? updates]) =>
      (JwkSetBuilder()..update(updates))._build();

  _$JwkSet._({required this.keys}) : super._();
  @override
  JwkSet rebuild(void Function(JwkSetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  JwkSetBuilder toBuilder() => JwkSetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is JwkSet && keys == other.keys;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, keys.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'JwkSet')..add('keys', keys))
        .toString();
  }
}

class JwkSetBuilder implements Builder<JwkSet, JwkSetBuilder> {
  _$JwkSet? _$v;

  ListBuilder<ECJwk>? _keys;
  ListBuilder<ECJwk> get keys => _$this._keys ??= ListBuilder<ECJwk>();
  set keys(ListBuilder<ECJwk>? keys) => _$this._keys = keys;

  JwkSetBuilder() {
    JwkSet._defaults(this);
  }

  JwkSetBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _keys = $v.keys.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(JwkSet other) {
    _$v = other as _$JwkSet;
  }

  @override
  void update(void Function(JwkSetBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  JwkSet build() => _build();

  _$JwkSet _build() {
    _$JwkSet _$result;
    try {
      _$result = _$v ??
          _$JwkSet._(
            keys: keys.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'keys';
        keys.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'JwkSet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
