import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hauth_mobile/generated/l10n.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          color: theme.surface,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/hauth_logo.svg',
                  width: 250,
                  height: 250,
                  semanticsLabel: S.of(context).intropage1_semantics,
                ),
                const SizedBox(height: 12),
                Text(
                  'HeartAuth',
                  style: TextStyle(
                    color: theme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 1.2,
                  ),
                ),
                Text(
                  S.of(context).appcard_title,
                  style: TextStyle(
                    color: theme.onPrimaryContainer,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
