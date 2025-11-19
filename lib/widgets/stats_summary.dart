import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hauth_mobile/providers/stats_provider.dart';

class StatsSummary extends ConsumerWidget {
  const StatsSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stats = ref.watch(statsProvider);
    final textTheme = Theme.of(context).textTheme;
    final cardColor = Theme.of(context).colorScheme.onSurface;

    Widget _buildStatItem(String label, int value) {
      return Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value.toString(),
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Card(
      color: cardColor,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Row(
          children: [
            _buildStatItem('Incoming', stats.incomingChallenges),
            Container(width: 1, height: 36, color: Colors.black12),
            _buildStatItem('Success', stats.successfulLogins),
            Container(width: 1, height: 36, color: Colors.black12),
            _buildStatItem('Paired', stats.pairedAccounts),
          ],
        ),
      ),
    );
  }
}
