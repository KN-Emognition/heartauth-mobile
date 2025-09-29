import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hauth_mobile/utils/challenge_data.dart';
import 'package:hauth_mobile/providers/login_challenge_provider.dart';
import 'package:hauth_mobile/providers/api_client_provider.dart';
import 'package:hauth_mobile/widgets/circular_countdown.dart';
import 'package:hauth_mobile/widgets/success_overlay.dart';
import 'package:hauth_mobile/watch/trigger_and_wait.dart';

import '../constant.dart';

class AuthScreen extends ConsumerWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final challenge = ref.watch(loginChallengeProvider);
    final api = ref.read(apiClientProvider);
    final theme = Theme.of(context).colorScheme;
    bool skipExpiredSnackBar = false;

    ref.listen<LoginChallenge?>(loginChallengeProvider, (prev, next) {
      if (next == null) {
        // Challenge expired, show a message and go back
        if (!skipExpiredSnackBar) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Challenge has expired!')),
          );
        }
        Navigator.of(context).pop();
      }
    });

    if (challenge == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Authentication Challenge',
            style: TextStyle(color: theme.onPrimaryContainer),
          ),
          centerTitle: true,
          backgroundColor: theme.primaryContainer,
        ),
        body: const Center(child: Text('No active challenge')),
      );
    }

    final expiryEpoch = challenge.expiresAt;
    final period = challenge.ttl;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(title: const Text('Authentication Challenge')),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "There's a new login attempt",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Challenge ID: ${challenge.challengeId}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: theme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final challengeCompleteRequest =
                            await buildChallengeCompleteRequest(
                              (await triggerAndWait(
                                measurementDurationMs: HEARTAUTH_MEASUREMENT_DURATION,
                                expiresAt: challenge.expiresAt * 1000,
                              )).data,
                              challenge.ephemeralPublicKeyPem,
                              challenge.nonce,
                            );

                        Response<void>? response;
                        try {
                          response = await api.run(
                            (client) => client
                                .getChallengeApi()
                                .externalChallengeComplete(
                                  id: challenge.challengeId,
                                  challengeCompleteRequest:
                                      challengeCompleteRequest,
                                ),
                          );
                        } on DioException catch (e) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Failed to complete challenge: ${e.response?.data['error'] ?? e.message}',
                                ),
                              ),
                            );
                            return;
                          }
                        }

                        if (response == null) {
                          return;
                        }

                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Challenge completed successfully!',
                              ),
                            ),
                          );
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (dialogContext) {
                              return SuccessAnimationOverlay(
                                onCompleted: () {
                                  skipExpiredSnackBar = true;
                                  ref
                                      .read(loginChallengeProvider.notifier)
                                      .clearChallenge();
                                  Navigator.of(dialogContext).pop();
                                },
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primary,
                        foregroundColor: theme.onPrimary,
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
        ),
        SafeArea(
          child: Center(
            child: CircularCountdown(
              expiryEpoch: expiryEpoch,
              period: period,
              size: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ),
      ],
    );
  }
}
