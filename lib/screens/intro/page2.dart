import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page2 extends PageViewModel {
  // ignore: unused_field
  final WidgetRef _ref;
  // ignore: unused_field
  final BuildContext _context;

  Page2(this._context, this._ref)
    : super(
        title: "How it works",
        body:
            "Our app uses your unique ECG/PPG signals as a biometric marker. Instead of fingerprints or face scans, your heartbeat helps confirm your identity — safer and more convenient than traditional login methods.",
        image: Center(
          child: SvgPicture.asset(
            'assets/intro2.svg',
            semanticsLabel: 'Secure login with heartbeat signal',
          ),
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
