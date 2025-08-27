//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi_client/src/model/device_credential.dart';
import 'package:openapi_client/src/model/flow_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pairing_confirm_response.g.dart';

/// PairingConfirmResponse
///
/// Properties:
/// * [status]
/// * [credential]
@BuiltValue()
abstract class PairingConfirmResponse
    implements Built<PairingConfirmResponse, PairingConfirmResponseBuilder> {
  @BuiltValueField(wireName: r'status')
  FlowStatus get status;
  // enum statusEnum {  PENDING,  APPROVED,  DENIED,  EXPIRED,  NOT_FOUND,  };

  @BuiltValueField(wireName: r'credential')
  DeviceCredential? get credential;

  PairingConfirmResponse._();

  factory PairingConfirmResponse(
          [void updates(PairingConfirmResponseBuilder b)]) =
      _$PairingConfirmResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PairingConfirmResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PairingConfirmResponse> get serializer =>
      _$PairingConfirmResponseSerializer();
}

class _$PairingConfirmResponseSerializer
    implements PrimitiveSerializer<PairingConfirmResponse> {
  @override
  final Iterable<Type> types = const [
    PairingConfirmResponse,
    _$PairingConfirmResponse
  ];

  @override
  final String wireName = r'PairingConfirmResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PairingConfirmResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(FlowStatus),
    );
    if (object.credential != null) {
      yield r'credential';
      yield serializers.serialize(
        object.credential,
        specifiedType: const FullType(DeviceCredential),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PairingConfirmResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PairingConfirmResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FlowStatus),
          ) as FlowStatus;
          result.status = valueDes;
          break;
        case r'credential':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DeviceCredential),
          ) as DeviceCredential;
          result.credential.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PairingConfirmResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PairingConfirmResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
