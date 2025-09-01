import 'package:hooks_riverpod/hooks_riverpod.dart';

enum ServerHealthStatus {
  healthy,
  unhealthy,
}

final serverHealthProvider = StateProvider<ServerHealthStatus>((ref) {
  return ServerHealthStatus.healthy; // assume healthy at start
});