import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hauth_mobile/utils/watch/contract.dart';
import 'package:uuid/uuid.dart';
import 'dart:convert';
import 'package:flutter_wear_os_connectivity/flutter_wear_os_connectivity.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

String timestamp() {
  final now = DateTime.now();

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  return "${now.year}_"
      "${twoDigits(now.month)}_"
      "${twoDigits(now.day)}_"
      "${twoDigits(now.hour)}_"
      "${twoDigits(now.minute)}_"
      "${twoDigits(now.second)}";
}

Future<void> _saveBodyToFile(String id, String username, String body) async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/${username.replaceAll(' ', '_')}_${timestamp()}_$id.json');
  await file.writeAsString(body);
  if (kDebugMode) {
    print('[triggerAndWait] saved full body to ${file.path}');
  }
}

final _uuid = const Uuid();

Future<TriggerResponse> triggerAndWait({
  required FlutterWearOsConnectivity wear,
  required EpochMillis expiresAt,
  required int measurementDurationMs,
  Map<String, dynamic> params = const {},
  String? username
}) async {
  if(kDebugMode) {
    if (username == null) {
      throw Exception(
        'Username must be provided in debug mode for logging purposes',
      );
    }
  }

  final req = TriggerRequest(
    id: _uuid.v4(),
    expiresAt: expiresAt,
    measurementDurationMs: measurementDurationMs,
  );

  final isoExpiry = DateTime.fromMillisecondsSinceEpoch(
    expiresAt,
    isUtc: true,
  ).toIso8601String();
  if (kDebugMode) {
    print(
      '[triggerAndWait] sending -> $triggerPath : ${{...req.toJson(), 'expiresAt(iso)': isoExpiry}}',
    );
  }

  final resultUri = Uri(scheme: 'wear', host: '*', path: resultPath);
  final completer = Completer<TriggerResponse>();

  late final StreamSubscription sub;
  sub = wear.messageReceived(pathURI: resultUri).listen((msg) async {
    try {
      final raw = utf8.decode(msg.data);
      final map = jsonDecode(raw) as Map<String, dynamic>;
      if (kDebugMode) {
        await _saveBodyToFile(req.id, username!, raw);
      }
      if (map['type'] == typeResult && map['id'] == req.id) {
        final resp = TriggerResponse.fromJson(map);
        if (!completer.isCompleted) completer.complete(resp);
      } else {
        if (kDebugMode) {
          print(
            '[triggerAndWait] non-matching message ignored (id=${map['id']}, type=${map['type']})',
          );
        }
      }
    } catch (e, st) {
      if (kDebugMode) {
        print('[triggerAndWait] parse error: $e\n$st');
      }
    }
  });

  final payload = Uint8List.fromList(utf8.encode(jsonEncode(req.toJson())));

  final devices = await wear.getConnectedDevices();
  if (devices.isEmpty) {
    if (kDebugMode) {
      print('[triggerAndWait] no connected Wear OS devices found');
    }
  }
  for (final d in devices) {
    try {
      final requestId = await wear.sendMessage(
        payload,
        deviceId: d.id,
        path: triggerPath,
        priority: MessagePriority.high,
      );
      if (kDebugMode) {
        print(
          '[triggerAndWait] tx -> ${d.id} $triggerPath (requestId=$requestId)',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('[triggerAndWait] send failed to ${d.id}: $e');
      }
    }
  }

  final now = DateTime.now().toUtc().millisecondsSinceEpoch;
  final remainingMs = (expiresAt - now).clamp(0, 1 << 31);

  return completer.future
      .timeout(
        Duration(milliseconds: remainingMs),
        onTimeout: () {
          if (kDebugMode) {
            print('[triggerAndWait] TIMEOUT at $isoExpiry for id=${req.id}');
          }
          return TriggerResponse(id: req.id, ok: false);
        },
      )
      .whenComplete(() async {
        if (kDebugMode) {
          print('[triggerAndWait] cleanup listener for id=${req.id}');
        }
        await sub.cancel();
      });
}
