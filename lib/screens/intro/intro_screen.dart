import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hauth_mobile/screens/intro/page1.dart';

final List<PageViewModel> introPages = [
  Page1(),
];

class IntroScreen extends ConsumerWidget {

  const IntroScreen({super.key});

  void onIntroDone(void Function() pairingAction, void Function() homeAction) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstRun', false);
    if (prefs.getBool('isPaired') ?? false) {
      pairingAction();
    } else {
      homeAction();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IntroductionScreen(
      pages: introPages,
      onDone: () => onIntroDone(() { Navigator.pushNamed(context, '/pairing'); }, () { Navigator.pushNamed(context, '/'); }),
      showSkipButton: true,
      skip: const Text("Skip"),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done"),
    );
  }
}