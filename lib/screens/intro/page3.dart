import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page3 extends PageViewModel {
  // ignore: unused_field
  final WidgetRef _ref;
  // ignore: unused_field
  final BuildContext _context;

  Page3(this._context, this._ref)
      : super(
    title: "Getting started",
    body:
    "To setup, you’ll scan a QR code from the web portal to link this app to your account. We'll also need access to your wearable connected via Bluetooth, which we will use to collect your biometric signals.",
    image: Center(
      child: SvgPicture.asset(
        'assets/intro3.svg',
        semanticsLabel: 'Phone and wearable device connected via Bluetooth',
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
