import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_wear_os_connectivity/helpers/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:hauth_mobile/providers/wearos_provider.dart';
import 'package:hauth_mobile/watch/contract.dart';

final currentStepProvider = FutureProvider<int>((ref) async {
  final cameraGranted = await Permission.camera.isGranted;
  if (!cameraGranted) return 0;

  final wearAsync = await ref.watch(wearOSProvider.future);

  final devices = await wearAsync.getConnectedDevices();
  if (devices.isEmpty) return 1;

  // check if samsung wear os device is present
  final hasSamsungWear = await Future.wait(
    devices.map(
      (device) async =>
          (await device.getCompanionPackageName()) ==
          'com.samsung.wearable.watchuniteplugin',
    ),
  ).then((results) => results.contains(true));

  if (!hasSamsungWear) {
    return 1;
  }

  // Listen for health check result
  final resultUri = Uri(scheme: 'wear', host: '*', path: healthCheckResultPath);
  final completer = Completer<bool>();
  late final StreamSubscription sub;
  sub = wearAsync.messageReceived(pathURI: resultUri).listen((msg) {
    // Parse and handle the message as needed
    final data = utf8.decode(msg.data);
    // Example: check for expected response
    if (kDebugMode) {
      print('[currentStepProvider] health check response: $data');
    }
    if (!completer.isCompleted) completer.complete(data.toLowerCase().contains('ok'));
  });

  for(final d in devices) {
    wearAsync.sendMessage(Uint8List.fromList(utf8.encode("Health check")), deviceId: d.id, path: healthCheckTriggerPath,priority: MessagePriority.high);
  }

  // Wait for response or timeout
  final healthOk = await completer.future.timeout(
    const Duration(seconds: 5),
    onTimeout: () => false,
  );
  await sub.cancel();

  if (!healthOk) return 2;

  final notificationGranted = await Permission.notification.isGranted;
  if (!notificationGranted) return 3;

  return 4;
});
