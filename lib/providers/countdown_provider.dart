import 'dart:async';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final countdownProvider = StreamProvider.family<Duration, int>((ref, expiryEpoch) {
  final expiry = DateTime.fromMillisecondsSinceEpoch(expiryEpoch * 1000);

  return Stream.periodic(const Duration(milliseconds: 100), (_) {
    final now = DateTime.now();
    final remaining = expiry.difference(now);
    return remaining.isNegative ? Duration.zero : remaining;
  }).distinct((prev, next) => prev.inMilliseconds == next.inMilliseconds);
});

