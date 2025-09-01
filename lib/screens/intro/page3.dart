import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hauth_mobile/providers/intro_step_provider.dart';

class Page3 extends PageViewModel {
  final WidgetRef _ref;
  final BuildContext _context;

  Page3(this._context, this._ref)
    : super(
        title: "Getting Started",
        image: Center(
          child: SvgPicture.asset(
            'assets/intro3.svg',
            semanticsLabel: 'Phone and wearable device connected via Bluetooth',
          ),
        ),
        bodyWidget: Consumer(
          builder: (context, ref, _) {
            final currentStepAsync = ref.watch(currentStepProvider);

            return currentStepAsync.when(
              data: (currentStep) => Column(
                children: [
                  Text(
                    "To setup, you’ll scan a QR code from the web portal to link this app to your account. We'll also need access to your wearable connected via Bluetooth, which we will use to collect your biometric signals.",
                    style: const TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: currentStep == 0
                          ? () async {
                              final status = await Permission.camera.request();

                              if (status.isGranted) {
                                ref.refresh(currentStepProvider);
                              }
                            }
                          : null,
                      child: Text("1. Grant camera access"),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: currentStep == 1
                          ? () async {
                              final status = await Permission.bluetoothConnect
                                  .request();

                              if (status.isGranted) {
                                ref.refresh(currentStepProvider);
                              }
                            }
                          : null,
                      child: Text("2. Grant device access"),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: currentStep == 2
                          ? () {
                              SharedPreferences.getInstance().then((prefs) {
                                prefs.setBool('isFirstRun', false);
                              });
                              Navigator.of(
                                context,
                              ).pushReplacementNamed("/pairing");
                            }
                          : null,
                      child: Text("3. Begin setup"),
                    ),
                  ),
                ],
              ),
              loading: () => CircularProgressIndicator(),
              error: (e, _) => Text('Error: $e'),
            );
          },
        ),
        decoration: PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w700,
          ),
          pageColor: Theme.of(_context).colorScheme.onPrimary,
        ),
      );
}
