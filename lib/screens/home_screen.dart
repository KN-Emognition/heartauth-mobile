import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hauth_mobile/providers/dev_mode_provider.dart';
import 'package:hauth_mobile/providers/stats_provider.dart';
import 'package:hauth_mobile/widgets/stats_summary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hauth_mobile/utils/challenge_data.dart';
import 'package:hauth_mobile/utils/watch/trigger_and_wait.dart';
import 'package:hauth_mobile/providers/login_challenge_provider.dart';
import 'package:hauth_mobile/providers/api_client_provider.dart';
import 'package:hauth_mobile/providers/wearos_provider.dart';
import 'package:hauth_mobile/widgets/circular_countdown.dart';
import 'package:hauth_mobile/widgets/success_overlay.dart';
import 'package:hauth_mobile/widgets/future_provider_view_builder.dart';
import 'package:hauth_mobile/widgets/app_card.dart';
import 'package:hauth_mobile/widgets/drawer_item.dart';
import 'package:hauth_mobile/widgets/language_settings_dialog.dart';
import 'package:hauth_mobile/widgets/lottie_animation.dart';
import 'package:hauth_mobile/constant.dart';
import 'package:hauth_mobile/generated/l10n.dart';

final successProvider = StateProvider<bool>((ref) =>false);

final _skipExpiredSnackBarProvider = StateProvider<bool>((ref) => false);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.invalidate(successProvider);
    final isSuccess = ref.watch(successProvider);
    final challenge = ref.watch(loginChallengeProvider);
    final api = ref.read(apiClientProvider);
    final stats = ref.read(statsProvider.notifier);
    final theme = Theme.of(context).colorScheme;
    final isDev = ref.watch(devModeProvider);

    ref.listen<LoginChallenge?>(loginChallengeProvider, (prev, next) {
      if (next == null) {
        final skip = ref.read(_skipExpiredSnackBarProvider);
        if (!skip) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(S.of(context).homescreen_challenge_expired)),
          );
        } else {
          // Reset the flag after suppressing the snackbar once.
          ref.read(_skipExpiredSnackBarProvider.notifier).state = false;
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          challenge == null
              ? 'HAuth Mobile'
              : S.of(context).homescreen_auth_challenge,
          style: TextStyle(color: theme.onSurface),
        ),
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
              title: S.of(context).homescreen_drawer_about,
              onTap: () {
                Navigator.of(context).pushNamed('/about');
              },
            ),
            DrawerItem(
              icon: Icons.phonelink_setup,
              title: S.of(context).homescreen_drawer_pair,
              onTap: () {
                Navigator.of(context).pushNamed('/pairing');
              },
            ),
            DrawerItem(
              icon: Icons.language,
              title: S.of(context).homescreen_drawer_language,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => const LanguageSettingsDialog(),
                );
              },
            ),
            isDev ? DrawerItem(
              icon: Icons.code,
              title: S.of(context).homescreen_drawer_debug,
              onTap: () {
                Navigator.of(context).pushNamed('/debug');
              },
            ) : SizedBox.shrink(),
          ],
        ),
      ),
      body: challenge == null
          ? Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 12.0,
                      left: 12.0,
                      right: 12.0,
                    ),
                    child: StatsSummary(),
                  ),
                ),
                Center(
                  child: Column(
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
              ],
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          S.of(context).homescreen_login_attempt,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          S
                              .of(context)
                              .homescreen_challenge_id(challenge.challengeId),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: theme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                    !isSuccess
                        ? SafeArea(
                            child: Center(
                              child: CircularCountdown(
                                expiryEpoch: challenge.expiresAt,
                                period: challenge.ttl,
                                size: MediaQuery.of(context).size.width * 0.5,
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                    SizedBox(
                      width: double.infinity,
                      child: FutureProviderViewBuilder(
                        provider: wearOSProvider,
                        viewBuilder: (con, rf, wear) {
                          return ElevatedButton(
                            onPressed: () async {

                              final triggerResponse = await triggerAndWait(
                                wear: wear,
                                measurementDurationMs:
                                    HEARTAUTH_MEASUREMENT_DURATION,
                                expiresAt: challenge.expiresAt * 1000,
                                context: context
                              );

                              if (triggerResponse == null) {
                                return;
                              }

                              final challengeCompleteRequest =
                                  await buildChallengeCompleteRequest(
                                    triggerResponse.data,
                                    challenge.ephemeralPublicKeyPem,
                                    challenge.nonce,
                                  );

                              Response<void>? response;
                              try {
                                response = await api.run(
                                  (client) => client
                                      .getChallengeApi()
                                      .completeChallenge(
                                        id: challenge.challengeId,
                                        completeChallengeRequest:
                                            challengeCompleteRequest,
                                      ),
                                  true,
                                );
                              } on DioException catch (e) {
                                ref.read(_skipExpiredSnackBarProvider.notifier).state = true;
                                await ref
                                    .read(loginChallengeProvider.notifier)
                                    .clearChallenge();
                                if(kDebugMode) {
                                  print('Error completing challenge: ${e.response?.data['error'] ?? e.message}');
                                }
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        // 'Failed to complete challenge: ${e.response?.data['error'] ?? e.message}',
                                        S.of(context).homescreen_challenge_fail,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      backgroundColor: theme.error,
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
                                      S
                                          .of(context)
                                          .homescreen_challenge_success,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    backgroundColor: Colors.lightGreen.shade800,
                                  ),
                                );
                                ref.read(successProvider.notifier).state = true;
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (dialogContext) {
                                    return SuccessAnimationOverlay(
                                      onCompleted: () async {
                                        await stats.incrementSuccess();
                                        ref.read(_skipExpiredSnackBarProvider.notifier).state = true;
                                        ref
                                            .read(
                                              loginChallengeProvider.notifier,
                                            )
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
                            child: Text(S.of(context).homescreen_button_text),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
