import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hauth_mobile/providers/login_challenge_provider.dart';
import 'package:hauth_mobile/widgets/circular_countdown.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challenge = ref.watch(loginChallengeProvider);

    ref.listen<LoginChallenge?>(loginChallengeProvider, (prev, next) {
      if (next == null) {
        // Challenge expired, show a message and go back
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Challenge has expired!')));
        Navigator.of(context).pop();
      }
    });

    if (challenge == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Authentication Challenge')),
        body: const Center(child: Text('No active challenge')),
      );
    }

    final expiryEpoch = challenge.expiresAt;
    final period = challenge.ttl;

    return Scaffold(
      appBar: AppBar(title: const Text('Authentication Challenge')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "There's a new login attempt",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              // Countdown indicator centered
              Expanded(
                child: Center(
                  child: CircularCountdown(
                    expiryEpoch: expiryEpoch,
                    period: period,
                    size: MediaQuery.of(context).size.width * 0.5,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: connect to wearOS ECG later
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Start measuring ECG"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
