import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, String>> pullDeviceInfo() async {
  final info = DeviceInfoPlugin();
  final android = await info.androidInfo;

  return {
    "deviceId": "android:${android.id}", // SSAID
    "displayName": "${android.manufacturer} ${android.model}",
    "platform": "ANDROID",
    "osVersion": android.version.release,
    "model": "${android.manufacturer} ${android.model}",
  };
}

Future<void> updateDeviceInfo() async {
  final info = await pullDeviceInfo();
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('deviceId', info['deviceId']!);
  await prefs.setString('displayName', info['displayName']!);
  await prefs.setString('platform', info['platform']!);
  await prefs.setString('osVersion', info['osVersion']!);
  await prefs.setString('model', info['model']!);
}