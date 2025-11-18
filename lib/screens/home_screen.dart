import 'package:flutter/material.dart';
import 'package:hauth_mobile/widgets/lottie_animation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hauth_mobile/generated/l10n.dart';
import 'package:hauth_mobile/providers/login_challenge_provider.dart';
import 'package:hauth_mobile/widgets/app_card.dart';
import 'package:hauth_mobile/widgets/drawer_item.dart';
import 'package:hauth_mobile/widgets/language_settings_dialog.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challenge = ref.watch(loginChallengeProvider);
    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('HAuth Mobile', style: TextStyle(color: theme.onSurface)),
        centerTitle: true,
        backgroundColor: theme.surfaceContainer,
      ),
      drawer: Drawer(
        backgroundColor: theme.primaryContainer,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 30),
            AppCard(),
            DrawerItem(
              icon: Icons.info,
              title: 'About',
              onTap: () {
                Navigator.of(context).pushNamed('/about');
              },
            ),
            DrawerItem(
              icon: Icons.phonelink_setup,
              title: 'Pair another account',
              onTap: () {
                Navigator.of(context).pushNamed('/pairing');
              },
            ),
            DrawerItem(
              icon: Icons.language,
              title: 'Choose language',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const LanguageSettingsDialog(),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: challenge != null
            ? ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/auth');
                },
                child: const Text('Authenticate'),
              )
            : Column(
                spacing: 8,
                mainAxisSize: MainAxisSize.min,
                children: [
                  LottieAnimation(
                    'assets/animations/tumbleweed.json',
                    height: 250,
                    width: 250,
                    loop: true,
                    loopDelay: Duration(seconds: 2),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      S.of(context).homescreen_no_login_attempts,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
