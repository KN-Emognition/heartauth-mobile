import 'dart:async';
import 'package:hauth_mobile/watch/contract.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_wear_os_connectivity/flutter_wear_os_connectivity.dart';

final _uuid = const Uuid();
final _wear = FlutterWearOsConnectivity();

Future<void> initWearLayer() async {
  await _wear.configureWearableAPI();
}

Future<TriggerResponse> triggerAndWait({
  required EpochMillis expiresAt,
  required int measurementDurationMs,
  Map<String, dynamic> params = const {},
}) async {
  final req = TriggerRequest(
    id: _uuid.v4(),
    expiresAt: expiresAt,
    measurementDurationMs: measurementDurationMs,
  );

  final isoExpiry = DateTime.fromMillisecondsSinceEpoch(
    expiresAt,
    isUtc: true,
  ).toIso8601String();
  print(
    '[triggerAndWait] sending -> $triggerPath : ${{...req.toJson(), 'expiresAt(iso)': isoExpiry}}',
  );

  final resultUri = Uri(scheme: 'wear', host: '*', path: resultPath);
  final completer = Completer<TriggerResponse>();

  late final StreamSubscription sub;
  sub = _wear.messageReceived(pathURI: resultUri).listen((msg) {
    try {
      final raw = utf8.decode(msg.data);
      final map = jsonDecode(raw) as Map<String, dynamic>;
      if (map['type'] == typeResult && map['id'] == req.id) {
        final resp = TriggerResponse.fromJson(map);
        if (!completer.isCompleted) completer.complete(resp);
      } else {
        print(
          '[triggerAndWait] non-matching message ignored (id=${map['id']}, type=${map['type']})',
        );
      }
    } catch (e, st) {
      print('[triggerAndWait] parse error: $e\n$st');
    }
  });

  final payload = Uint8List.fromList(utf8.encode(jsonEncode(req.toJson())));

  final devices = await _wear.getConnectedDevices();
  if (devices.isEmpty) {
    print('[triggerAndWait] no connected Wear OS devices found');
  }
  for (final d in devices) {
    try {
      final requestId = await _wear.sendMessage(
        payload,
        deviceId: d.id,
        path: triggerPath,
        priority: MessagePriority.high,
      );
      print(
        '[triggerAndWait] tx -> ${d.id} $triggerPath (requestId=$requestId)',
      );
    } catch (e) {
      print('[triggerAndWait] send failed to ${d.id}: $e');
    }
  }

  final now = DateTime.now().toUtc().millisecondsSinceEpoch;
  final remainingMs = (expiresAt - now).clamp(0, 1 << 31);

  return completer.future
      .timeout(
        Duration(milliseconds: remainingMs),
        onTimeout: () {
          print('[triggerAndWait] TIMEOUT at $isoExpiry for id=${req.id}');
          return TriggerResponse(id: req.id, ok: false);
        },
      )
      .whenComplete(() async {
        print('[triggerAndWait] cleanup listener for id=${req.id}');
        await sub.cancel();
      });
}
