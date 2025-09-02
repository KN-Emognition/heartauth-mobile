import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:openapi_client/openapi_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hauth_mobile/providers/api_client_provider.dart';
import 'package:hauth_mobile/utils/pairing_data.dart';
import 'package:hauth_mobile/widgets/success_overlay.dart';
import 'package:toastification/toastification.dart';

class PairingScreen extends HookConsumerWidget {
  const PairingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MobileScannerController cameraController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
      formats: [BarcodeFormat.qrCode],
      detectionSpeed: DetectionSpeed.noDuplicates,
      returnImage: false,
    );

    final api = ref.read(apiClientProvider);

    return MobileScanner(
      controller: cameraController,
      onDetect: (code) async {
        if (code.barcodes.isEmpty) {
          return;
        }

        final codeValue = code.barcodes.first.rawValue;
        if (codeValue == null || codeValue.isEmpty) {
          return;
        }

        final parts = codeValue.split('.');
        if (parts.length != 3) {
          print('Scanned code is not a JWT');
          return; // Not a JWT, do nothing
        }

        // Load the default display name from preferences
        final preferences = await SharedPreferences.getInstance();
        final defaultDisplayName =
            preferences.getString('displayName') ?? 'My Device';
        final displayNameController = TextEditingController(
          text: defaultDisplayName,
        );

        // Show confirmation dialog with display name input
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure you want to register this device?'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Device display name:'),
                TextField(controller: displayNameController),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Register'),
              ),
            ],
          ),
        );

        if (confirmed != true) return;

        // Save the (possibly updated) display name
        await preferences.setString('displayName', displayNameController.text);

        final pairingData = await buildInitPairingRequest(codeValue);

        Response<PairingInitResponse>? initResult;
        try {
          initResult = await api.run(
            (client) => client.getPairingApi().externalPairingInit(
              pairingInitRequest: pairingData.$1,
              headers: pairingData.$2,
            ),
            true,
          );
        } on DioException catch (e) {
          if (kDebugMode) {
            print('Pairing initialization failed: ${e.response?.statusCode} ${e.response?.data['error']}');
          }
          toastification.show(
            title: Text('Pairing failed: ${e.response?.data['error'] ?? 'Unknown error'}'),
            type: ToastificationType.error,
            autoCloseDuration: const Duration(seconds: 5)
          );
        }

        if (initResult == null) {
          return;
        }

        final confirmPairingData = await buildConfirmPairingRequest(
          initResult.data!,
        );

        Response<PairingConfirmResponse>? confirmResult;
        try {
          confirmResult = await api.run(
            (client) => client.getPairingApi().externalPairingConfirm(
              pairingConfirmRequest: confirmPairingData.$1,
              headers: confirmPairingData.$2,
            ),
            true,
          );
        } on DioException catch (e) {
          if (kDebugMode) {
            print('Pairing confirmation failed: ${e.response?.statusCode} ${e.response?.data['error']}');
          }
          toastification.show(
              title: Text('Pairing failed: ${e.response?.data['error'] ?? 'Unknown error'}'),
              type: ToastificationType.error,
              autoCloseDuration: const Duration(seconds: 5)
          );
        }

        if (confirmResult == null) {
          return;
        }

        await preferences.setBool('isPaired', true);
        if (context.mounted) {
          Navigator.of(context).push(
            PageRouteBuilder(
              opaque: false,
              pageBuilder: (_, _, _) =>
                  const SuccessAnimationOverlay(nextRoute: '/home'),
            ),
          );

          // Stop the scanner
          await cameraController.stop();
        }
      },
    );
  }
}
