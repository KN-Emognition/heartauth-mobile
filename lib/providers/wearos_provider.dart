import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_wear_os_connectivity/flutter_wear_os_connectivity.dart';

final wearOSProvider = FutureProvider<FlutterWearOsConnectivity>((ref) async {
  final wear = FlutterWearOsConnectivity();
  await wear.configureWearableAPI();
  return wear;
});