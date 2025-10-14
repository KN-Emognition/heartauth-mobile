import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:hauth_mobile/screens/intro/page1.dart';
import 'package:hauth_mobile/screens/intro/page2.dart';
import 'package:hauth_mobile/screens/intro/page4.dart';
import 'package:hauth_mobile/screens/intro/page3.dart';

class IntroScreen extends ConsumerWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<PageViewModel> introPages = [
      Page1(context, ref),
      Page2(context, ref),
      Page3(context, ref),
      Page4(context, ref),
    ];

    return IntroductionScreen(
      pages: introPages,
      showDoneButton: true,
      overrideDone: (con, fun) => TextButton(child: Icon(Icons.arrow_forward, color: Colors.white), onPressed: null), // fake invisible button to prevent intro screen footer from chaning size when 'next' button disappears
      showSkipButton: false,
      dotsContainerDecorator: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      globalBackgroundColor: Theme.of(context).colorScheme.onPrimary,
      next: const Icon(Icons.arrow_forward),
    );
  }
}
