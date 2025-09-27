import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hauth_api_external/hauth_api_external.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hauth_mobile/providers/api_client_provider.dart';
import 'package:hauth_mobile/utils/pairing_data.dart';
import 'package:hauth_mobile/widgets/success_overlay.dart';

class PairingScreen extends HookConsumerWidget {
  PairingScreen({super.key});

  void onDetect(
    QRViewController controller,
    Barcode code,
    BuildContext context,
    ApiWrapper api,
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
        preferences.getString('displayName') ?? 'My Device';
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
      await controller.resumeCamera();
      return;
    }

    // Save the (possibly updated) display name
    await preferences.setString('displayName', displayNameController.text);

    final pairingData = await buildInitPairingRequest(code.code!);

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
      await controller.resumeCamera();
    }

    if (initResult == null) {
      await controller.resumeCamera();
      return;
    }

    Response<JwkSet>? keyResponse;
    try {
      keyResponse = await api.run(
            (client) => client.getWellKnownApi().getJwks(),
        true,
      );
    }on DioException catch (e){}

    final confirmPairingData = await buildConfirmPairingRequest(
      initResult.data!,
      List.of([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]),
        keyResponse!.data!
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
              if (context.mounted) {
                Navigator.of(dialogContext).pop();
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

    final double scanSize = MediaQuery.of(context).size.width * 0.8;

    final scanner = QRView(
      key: GlobalKey(debugLabel: 'QR'),
      onQRViewCreated: (QRViewController controller) {
        controller.scannedDataStream.listen((scanData) {
          if (context.mounted) {
            onDetect(controller, scanData, context, api);
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
                    'Please align the pairing code within the frame',
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
