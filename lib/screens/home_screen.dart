import 'package:flutter/material.dart';
import 'package:hauth_mobile/providers/countdown_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hauth_mobile/providers/login_challenge_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challenge = ref.watch(loginChallengeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('HAuth Mobile')),
      body: Center(
          child: challenge != null
              ? ElevatedButton(onPressed: () {
                Navigator.of(context).pushNamed('/auth');
          }, child: const Text('Authenticate'))
              : const Text('No pending login attempts')
      ),
    );
  }
}
