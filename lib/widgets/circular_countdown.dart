import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hauth_mobile/providers/countdown_provider.dart';

class CircularCountdown extends ConsumerWidget {
  final int expiryEpoch;
  final int period; // e.g. 30s OTP cycle
  final double? size; // optional fixed size

  const CircularCountdown({
    super.key,
    required this.expiryEpoch,
    required this.period,
    this.size,
  });

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRemaining = ref.watch(countdownProvider(expiryEpoch));

    Widget buildContent(Duration remaining, double actualSize) {
      final secondsLeft = remaining.inSeconds;
      final progress = (remaining.inMilliseconds / (period * 1000)).clamp(
        0.0,
        1.0,
      );

      return Stack(
        alignment: Alignment.center,
        children: [
          SizedBox.expand(
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: actualSize * 0.08, // thinner stroke relative to size
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              valueColor: AlwaysStoppedAnimation<Color>(
                secondsLeft < 5
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          FittedBox(
            child: Text(
              _formatDuration(remaining),
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: actualSize * 0.25, // scales with widget size
              ),
            ),
          ),
        ],
      );
    }

    return asyncRemaining.when(
      data: (remaining) {
        if (size != null) {
          return SizedBox(
            width: size,
            height: size,
            child: buildContent(remaining, size!),
          );
        } else {
          return LayoutBuilder(
            builder: (context, constraints) {
              final actualSize = constraints.biggest.shortestSide;
              return SizedBox(
                width: actualSize,
                height: actualSize,
                child: buildContent(remaining, actualSize),
              );
            },
          );
        }
      },
      loading: () => const CircularProgressIndicator(),
      error: (e, _) =>
          Icon(Icons.error, color: Theme.of(context).colorScheme.error),
    );
  }
}
