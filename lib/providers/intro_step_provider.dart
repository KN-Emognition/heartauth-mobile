import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final currentStepProvider = FutureProvider<int>((ref) async {
  final cameraGranted = await Permission.camera.isGranted;
  if (!cameraGranted) return 0;

  final nearbyGranted = await Permission.bluetoothConnect.isGranted;
  if (!nearbyGranted) return 1;

  return 2;
});