import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wear_os_connectivity/flutter_wear_os_connectivity.dart';
import 'package:hauth_api_external/hauth_api_external.dart';
import 'package:hauth_mobile/providers/stats_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hauth_mobile/providers/api_client_provider.dart';
import 'package:hauth_mobile/providers/wearos_provider.dart';
import 'package:hauth_mobile/utils/pairing_data.dart';
import 'package:hauth_mobile/utils/watch/trigger_and_wait.dart';
import 'package:hauth_mobile/widgets/success_overlay.dart';
import 'package:hauth_mobile/widgets/future_provider_view_builder.dart';
import 'package:hauth_mobile/constant.dart';
import 'package:hauth_mobile/generated/l10n.dart';

class PairingScreen extends HookConsumerWidget {
  PairingScreen({super.key});

  void onDetect(
    QRViewController controller,
    Barcode code,
    BuildContext context,
    FlutterWearOsConnectivity wear,
    ApiWrapper api,
    StatsNotifier stats,
    ColorScheme theme,
  ) async {
    await controller.pauseCamera();

    if (code.code == null || code.code!.isEmpty) {
      await controller.resumeCamera();
      return;
    }

    if (kDebugMode) {
      print(code.code!);
    }

    final parts = code.code!.split('.');
    if (parts.length != 3) {
      if (kDebugMode) {
        print('Scanned code is not a JWT');
      }
      await controller.resumeCamera();
      return;
    }

    // Load the default display name from preferences
    final preferences = await SharedPreferences.getInstance();
    final defaultDisplayName =
        preferences.getString('displayName') ??
        (context.mounted
            ? S.of(context).pairingscreen_generic_device_name
            : 'My Device');
    final displayNameController = TextEditingController(
      text: defaultDisplayName,
    );

    if (!context.mounted) {
      await controller.resumeCamera();
      return;
    }

    // Show confirmation dialog with display name input
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(S.of(context).pairingscreen_pairing_confirmation),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(S.of(context).pairingscreen_device_display_name),
            TextField(controller: displayNameController),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(S.of(context).pairingscreen_cancel_button),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(S.of(context).pairingscreen_register_button),
          ),
        ],
      ),
    );

    if (confirmed != true) {
      await controller.resumeCamera();
      return;
    }

    // Save the (possibly updated) display name
    await preferences.setString('displayName', displayNameController.text);

    final pairingData = await buildInitPairingRequest(code.code!);

    Response<InitPairingResponse>? initResult;
    try {
      initResult = await api.run(
        (client) => client.getPairingApi().initPairing(
          initPairingRequest: pairingData.$1,
          headers: pairingData.$2,
        ),
        true,
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print(
          'Pairing initialization failed: ${e.response?.statusCode} ${e.response?.data['error']}',
        );
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              S
                  .of(context)
                  .pairingscreen_fail(
                    e.response?.data['error'] ??
                        S.of(context).pairingscreen_generic_error,
                  ),
            ),
            backgroundColor: theme.error,
          ),
        );
      }
      await controller.resumeCamera();
    }

    if (initResult == null) {
      await controller.resumeCamera();
      return;
    }

    Response<JwkSet>? keyResponse;
    try {
      keyResponse = await api.run(
        (client) => client.getWellKnownApi().getWellKnown(),
        true,
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print(
          'JWKS fetching failed: ${e.response?.statusCode} ${e.response?.data['error']}',
        );
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              S
                  .of(context)
                  .pairingscreen_fail(
                    e.response?.data['error'] ??
                        S.of(context).pairingscreen_generic_error,
                  ),
            ),
            backgroundColor: theme.error,
          ),
        );
      }
      await controller.resumeCamera();
    }

    if (keyResponse == null) {
      await controller.resumeCamera();
      return;
    }
    final confirmPairingData = await buildConfirmPairingRequest(
      initResult.data!,
      (await triggerAndWait(
        wear: wear,
        measurementDurationMs: HEARTAUTH_MEASUREMENT_DURATION,
        expiresAt: initResult.data!.expiresAt * 1000,
      )).data,
      keyResponse.data!,
    );

    Response<void>? confirmResult;
    try {
      confirmResult = await api.run(
        (client) => client.getPairingApi().completePairing(
          completePairingRequest: confirmPairingData.$1,
          headers: confirmPairingData.$2,
        ),
        true,
      );
    } on DioException catch (e) {
      if (kDebugMode) {
        print(
          'Pairing confirmation failed: ${e.response?.statusCode} ${e.response?.data['error']}',
        );
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              S
                  .of(context)
                  .pairingscreen_fail(
                    e.response?.data['error'] ??
                        S.of(context).pairingscreen_generic_error,
                  ),
            ),
            backgroundColor: theme.error,
          ),
        );
      }
      await controller.resumeCamera();
    }

    if (confirmResult == null) {
      await controller.resumeCamera();
      return;
    }

    await preferences.setBool('isPaired', true);
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        // Prevents closing the dialog by tapping outside
        builder: (dialogContext) {
          return SuccessAnimationOverlay(
            onCompleted: () async {
              await controller.stopCamera();
              await stats.incrementPaired();
              if (context.mounted) {
                while (Navigator.of(dialogContext).canPop()) {
                  Navigator.of(dialogContext).pop();
                }
                Navigator.of(dialogContext).pushReplacementNamed('/home');
              }
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final api = ref.read(apiClientProvider);
    final stats = ref.read(statsProvider.notifier);
    final theme = Theme.of(context).colorScheme;

    final double scanSize = MediaQuery.of(context).size.width * 0.8;

    final scanner = FutureProviderViewBuilder(
      provider: wearOSProvider,
      viewBuilder: (context, ref, wear) {
        return QRView(
          key: GlobalKey(debugLabel: 'QR'),
          onQRViewCreated: (QRViewController controller) {
            controller.scannedDataStream.listen((scanData) {
              if (context.mounted) {
                onDetect(
                  controller,
                  scanData,
                  context,
                  wear,
                  api,
                  stats,
                  theme,
                );
              }
            });
          },
          overlay: QrScannerOverlayShape(
            borderColor: Colors.white,
            overlayColor: Colors.black.withValues(alpha: 0.5),
            borderRadius: 10,
            cutOutSize: scanSize,
          ),
        );
      },
      bgColor: Colors.black,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          scanner,
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                color: Colors.transparent,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    S.of(context).pairingscreen_qr_prompt,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
