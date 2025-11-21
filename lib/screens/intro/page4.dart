import 'package:flutter/material.dart';
import 'package:hauth_mobile/utils/open_app.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hauth_mobile/widgets/future_provider_view_builder.dart';
import 'package:hauth_mobile/providers/intro_step_provider.dart';
import 'package:hauth_mobile/generated/l10n.dart';

class Page4 extends PageViewModel {
  // ignore: unused_field
  final WidgetRef _ref;

  // ignore: unused_field
  final BuildContext _context;

  Page4(this._context, this._ref)
    : super(
        title: S.of(_context).intropage4_title,
        image: Center(
          child: SvgPicture.asset(
            'assets/intro4.svg',
            semanticsLabel: S.of(_context).intropage4_semantics,
          ),
        ),
        bodyWidget: FutureProviderViewBuilder(
          provider: currentStepProvider,
          viewBuilder: (context, ref, currentStep) {
            return Column(
              children: [
                // SizedBox(
                //   width: 300,
                //   child: IconButton(
                //     icon: Icon(Icons.refresh),
                //     onPressed: () {
                //       ref.refresh(currentStepProvider);
                //     },
                //   )
                // ),
                SizedBox(
                  width: 300,
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
                              // ignore: unused_result
                              ref.refresh(currentStepProvider);
                            }
                          }
                        : null,
                    child: Text(S.of(_context).intropage4_step1("1.")),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: currentStep == 1
                        ? () async {
                            openAppOrPlayStore(
                              'com.samsung.android.app.watchmanager',
                              onError: (error) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        S
                                            .of(_context)
                                            .intropage4_galaxy_wearable_error,
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                            ref.refresh(currentStepProvider);
                          }
                        : null,
                    child: Text(S.of(_context).intropage4_step2("2.")),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: currentStep == 2
                        ? () async {
                            try {
                              launchUrl(
                                Uri.parse(
                                  "https://github.com/KN-Emognition/heartauth-wear-os",
                                ),
                              );
                            } catch (e) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      S.of(_context).intropage4_app_page_error,
                                    ),
                                  ),
                                );
                              }
                            }
                            ref.refresh(currentStepProvider);
                          }
                        : null,
                    child: Text(S.of(_context).intropage4_step3("3.")),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: currentStep == 3
                        ? () async {
                            final status = await Permission.notification
                                .request();

                            if (status.isGranted) {
                              // ignore: unused_result
                              ref.refresh(currentStepProvider);
                            }
                          }
                        : null,
                    child: Text(S.of(_context).intropage4_step4("4.")),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: currentStep == 4
                        ? () {
                            SharedPreferences.getInstance().then((prefs) {
                              prefs.setBool('isFirstRun', false);
                            });
                            Navigator.of(
                              context,
                            ).pushReplacementNamed("/pairing");
                          }
                        : null,
                    child: Text(S.of(_context).intropage4_step5("5.")),
                  ),
                ),
              ],
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
