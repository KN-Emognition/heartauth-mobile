// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ec_jwk.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ECJwkKtyEnum _$eCJwkKtyEnum_EC = const ECJwkKtyEnum._('EC');

ECJwkKtyEnum _$eCJwkKtyEnumValueOf(String name) {
  switch (name) {
    case 'EC':
      return _$eCJwkKtyEnum_EC;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ECJwkKtyEnum> _$eCJwkKtyEnumValues =
    BuiltSet<ECJwkKtyEnum>(const <ECJwkKtyEnum>[
  _$eCJwkKtyEnum_EC,
]);

const ECJwkCrvEnum _$eCJwkCrvEnum_n256 = const ECJwkCrvEnum._('n256');
const ECJwkCrvEnum _$eCJwkCrvEnum_n384 = const ECJwkCrvEnum._('n384');
const ECJwkCrvEnum _$eCJwkCrvEnum_n521 = const ECJwkCrvEnum._('n521');

ECJwkCrvEnum _$eCJwkCrvEnumValueOf(String name) {
  switch (name) {
    case 'n256':
      return _$eCJwkCrvEnum_n256;
    case 'n384':
      return _$eCJwkCrvEnum_n384;
    case 'n521':
      return _$eCJwkCrvEnum_n521;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ECJwkCrvEnum> _$eCJwkCrvEnumValues =
    BuiltSet<ECJwkCrvEnum>(const <ECJwkCrvEnum>[
  _$eCJwkCrvEnum_n256,
  _$eCJwkCrvEnum_n384,
  _$eCJwkCrvEnum_n521,
]);

const ECJwkUseEnum _$eCJwkUseEnum_sig = const ECJwkUseEnum._('sig');
const ECJwkUseEnum _$eCJwkUseEnum_enc = const ECJwkUseEnum._('enc');

ECJwkUseEnum _$eCJwkUseEnumValueOf(String name) {
  switch (name) {
    case 'sig':
      return _$eCJwkUseEnum_sig;
    case 'enc':
      return _$eCJwkUseEnum_enc;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ECJwkUseEnum> _$eCJwkUseEnumValues =
    BuiltSet<ECJwkUseEnum>(const <ECJwkUseEnum>[
  _$eCJwkUseEnum_sig,
  _$eCJwkUseEnum_enc,
]);

Serializer<ECJwkKtyEnum> _$eCJwkKtyEnumSerializer = _$ECJwkKtyEnumSerializer();
Serializer<ECJwkCrvEnum> _$eCJwkCrvEnumSerializer = _$ECJwkCrvEnumSerializer();
Serializer<ECJwkUseEnum> _$eCJwkUseEnumSerializer = _$ECJwkUseEnumSerializer();

class _$ECJwkKtyEnumSerializer implements PrimitiveSerializer<ECJwkKtyEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'EC': 'EC',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'EC': 'EC',
  };

  @override
  final Iterable<Type> types = const <Type>[ECJwkKtyEnum];
  @override
  final String wireName = 'ECJwkKtyEnum';

  @override
  Object serialize(Serializers serializers, ECJwkKtyEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ECJwkKtyEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ECJwkKtyEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ECJwkCrvEnumSerializer implements PrimitiveSerializer<ECJwkCrvEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'n256': 'P-256',
    'n384': 'P-384',
    'n521': 'P-521',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'P-256': 'n256',
    'P-384': 'n384',
    'P-521': 'n521',
  };

  @override
  final Iterable<Type> types = const <Type>[ECJwkCrvEnum];
  @override
  final String wireName = 'ECJwkCrvEnum';

  @override
  Object serialize(Serializers serializers, ECJwkCrvEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ECJwkCrvEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ECJwkCrvEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ECJwkUseEnumSerializer implements PrimitiveSerializer<ECJwkUseEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'sig': 'sig',
    'enc': 'enc',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'sig': 'sig',
    'enc': 'enc',
  };

  @override
  final Iterable<Type> types = const <Type>[ECJwkUseEnum];
  @override
  final String wireName = 'ECJwkUseEnum';

  @override
  Object serialize(Serializers serializers, ECJwkUseEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  ECJwkUseEnum deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ECJwkUseEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$ECJwk extends ECJwk {
  @override
  final ECJwkKtyEnum kty;
  @override
  final ECJwkCrvEnum crv;
  @override
  final String x;
  @override
  final String y;
  @override
  final String? kid;
  @override
  final ECJwkUseEnum? use;
  @override
  final String? alg;
  @override
  final String? x5u;
  @override
  final BuiltList<String>? x5c;
  @override
  final String? x5t;
  @override
  final String? x5tHashS256;

  factory _$ECJwk([void Function(ECJwkBuilder)? updates]) =>
      (ECJwkBuilder()..update(updates))._build();

  _$ECJwk._(
      {required this.kty,
      required this.crv,
      required this.x,
      required this.y,
      this.kid,
      this.use,
      this.alg,
      this.x5u,
      this.x5c,
      this.x5t,
      this.x5tHashS256})
      : super._();
  @override
  ECJwk rebuild(void Function(ECJwkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ECJwkBuilder toBuilder() => ECJwkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ECJwk &&
        kty == other.kty &&
        crv == other.crv &&
        x == other.x &&
        y == other.y &&
        kid == other.kid &&
        use == other.use &&
        alg == other.alg &&
        x5u == other.x5u &&
        x5c == other.x5c &&
        x5t == other.x5t &&
        x5tHashS256 == other.x5tHashS256;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, kty.hashCode);
    _$hash = $jc(_$hash, crv.hashCode);
    _$hash = $jc(_$hash, x.hashCode);
    _$hash = $jc(_$hash, y.hashCode);
    _$hash = $jc(_$hash, kid.hashCode);
    _$hash = $jc(_$hash, use.hashCode);
    _$hash = $jc(_$hash, alg.hashCode);
    _$hash = $jc(_$hash, x5u.hashCode);
    _$hash = $jc(_$hash, x5c.hashCode);
    _$hash = $jc(_$hash, x5t.hashCode);
    _$hash = $jc(_$hash, x5tHashS256.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ECJwk')
          ..add('kty', kty)
          ..add('crv', crv)
          ..add('x', x)
          ..add('y', y)
          ..add('kid', kid)
          ..add('use', use)
          ..add('alg', alg)
          ..add('x5u', x5u)
          ..add('x5c', x5c)
          ..add('x5t', x5t)
          ..add('x5tHashS256', x5tHashS256))
        .toString();
  }
}

class ECJwkBuilder implements Builder<ECJwk, ECJwkBuilder> {
  _$ECJwk? _$v;

  ECJwkKtyEnum? _kty;
  ECJwkKtyEnum? get kty => _$this._kty;
  set kty(ECJwkKtyEnum? kty) => _$this._kty = kty;

  ECJwkCrvEnum? _crv;
  ECJwkCrvEnum? get crv => _$this._crv;
  set crv(ECJwkCrvEnum? crv) => _$this._crv = crv;

  String? _x;
  String? get x => _$this._x;
  set x(String? x) => _$this._x = x;

  String? _y;
  String? get y => _$this._y;
  set y(String? y) => _$this._y = y;

  String? _kid;
  String? get kid => _$this._kid;
  set kid(String? kid) => _$this._kid = kid;

  ECJwkUseEnum? _use;
  ECJwkUseEnum? get use => _$this._use;
  set use(ECJwkUseEnum? use) => _$this._use = use;

  String? _alg;
  String? get alg => _$this._alg;
  set alg(String? alg) => _$this._alg = alg;

  String? _x5u;
  String? get x5u => _$this._x5u;
  set x5u(String? x5u) => _$this._x5u = x5u;

  ListBuilder<String>? _x5c;
  ListBuilder<String> get x5c => _$this._x5c ??= ListBuilder<String>();
  set x5c(ListBuilder<String>? x5c) => _$this._x5c = x5c;

  String? _x5t;
  String? get x5t => _$this._x5t;
  set x5t(String? x5t) => _$this._x5t = x5t;

  String? _x5tHashS256;
  String? get x5tHashS256 => _$this._x5tHashS256;
  set x5tHashS256(String? x5tHashS256) => _$this._x5tHashS256 = x5tHashS256;

  ECJwkBuilder() {
    ECJwk._defaults(this);
  }

  ECJwkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _kty = $v.kty;
      _crv = $v.crv;
      _x = $v.x;
      _y = $v.y;
      _kid = $v.kid;
      _use = $v.use;
      _alg = $v.alg;
      _x5u = $v.x5u;
      _x5c = $v.x5c?.toBuilder();
      _x5t = $v.x5t;
      _x5tHashS256 = $v.x5tHashS256;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ECJwk other) {
    _$v = other as _$ECJwk;
  }

  @override
  void update(void Function(ECJwkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ECJwk build() => _build();

  _$ECJwk _build() {
    _$ECJwk _$result;
    try {
      _$result = _$v ??
          _$ECJwk._(
            kty: BuiltValueNullFieldError.checkNotNull(kty, r'ECJwk', 'kty'),
            crv: BuiltValueNullFieldError.checkNotNull(crv, r'ECJwk', 'crv'),
            x: BuiltValueNullFieldError.checkNotNull(x, r'ECJwk', 'x'),
            y: BuiltValueNullFieldError.checkNotNull(y, r'ECJwk', 'y'),
            kid: kid,
            use: use,
            alg: alg,
            x5u: x5u,
            x5c: _x5c?.build(),
            x5t: x5t,
            x5tHashS256: x5tHashS256,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'x5c';
        _x5c?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(r'ECJwk', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
