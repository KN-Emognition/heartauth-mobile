import 'package:hauth_mobile/providers/wearos_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

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

  final notificationGranted = await Permission.notification.isGranted;
  if (!notificationGranted) return 2;

  return 3;
});
