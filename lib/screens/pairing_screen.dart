import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hauth_api_external/hauth_api_external.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hauth_mobile/providers/api_client_provider.dart';
import 'package:hauth_mobile/utils/pairing_data.dart';
import 'package:hauth_mobile/widgets/success_overlay.dart';

class PairingScreen extends HookConsumerWidget {
  const PairingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MobileScannerController cameraController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
      formats: [BarcodeFormat.all],
      detectionSpeed: DetectionSpeed.normal,
      detectionTimeoutMs: 1000,
      returnImage: false,
    );

    final api = ref.read(apiClientProvider);

    final double scanSize = MediaQuery.of(context).size.width * 0.8;

    final scanWindow = Rect.fromCenter(
      center: MediaQuery.sizeOf(context).center(Offset.zero),
      width: scanSize,
      height: scanSize,
    );

    final scanner = MobileScanner(
      controller: cameraController,
      scanWindow: scanWindow,
      onDetect: (code) async {
        await cameraController.pause();

        if (code.barcodes.isEmpty) {
          await cameraController.start();
          return;
        }

        final codeValue = code.barcodes.first.rawValue;
        if (kDebugMode) {
          print(codeValue);
        }
        if (codeValue == null || codeValue.isEmpty) {
          await cameraController.start();
          return;
        }

        final parts = codeValue.split('.');
        if (parts.length != 3) {
          if (kDebugMode) {
            print('Scanned code is not a JWT');
          }
          await cameraController.start();
          return; // Not a JWT, do nothing
        }

        // Load the default display name from preferences
        final preferences = await SharedPreferences.getInstance();
        final defaultDisplayName =
            preferences.getString('displayName') ?? 'My Device';
        final displayNameController = TextEditingController(
          text: defaultDisplayName,
        );

        if (!context.mounted) {
          await cameraController.start();
          return;
        }

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

        if (confirmed != true) {
          await cameraController.start();
          return;
        }

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
            print(
              'Pairing initialization failed: ${e.response?.statusCode} ${e.response?.data['error']}',
            );
          }
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Pairing failed: ${e.response?.data['error'] ?? 'Unknown error'}',
                ),
              ),
            );
          }
          await cameraController.start();
        }

        if (initResult == null) {
          await cameraController.start();
          return;
        }

        final confirmPairingData = await buildConfirmPairingRequest(
          initResult.data!,
        );

        Response<void>? confirmResult;
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
            print(
              'Pairing confirmation failed: ${e.response?.statusCode} ${e.response?.data['error']}',
            );
          }
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Pairing failed: ${e.response?.data['error'] ?? 'Unknown error'}',
                ),
              ),
            );
          }
          await cameraController.start();
        }

        if (confirmResult == null) {
          await cameraController.start();
          return;
        }

        await preferences.setBool('isPaired', true);
        if (context.mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            // Prevents closing the dialog by tapping outside
            builder: (context) {
              return SuccessAnimationOverlay(
                onCompleted: () async {
                  await cameraController.stop();
                  if (context.mounted) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed('/home');
                  }
                },
              );
            },
          );
        }
      },
    );

    return Stack(
      children: [
        scanner,
        ScanWindowOverlay(
          controller: cameraController,
          scanWindow: scanWindow,
          borderRadius: BorderRadius.all(Radius.circular(scanSize * 0.05)),
        ),
        Positioned(
          top: 40,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.transparent,
              child: Material(
                color: Colors.transparent,
                child: Text(
                  'Please align the pairing code within the frame',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}
