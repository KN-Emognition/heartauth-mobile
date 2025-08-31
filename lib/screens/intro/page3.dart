import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page3 extends PageViewModel {
  Page3()
      : super(
    title: "How it works",
    body: "To setup, you’ll scan a QR code from the web portal to link this app to your account. We'll also need access to your wearable connected via Bluetooth, which we will use to collect your biometric signals.",
    image: Center(
      child: SvgPicture.asset(
        'assets/intro3.svg',
        semanticsLabel: 'Phone and wearable device connected via Bluetooth',
      ),
    ),
    decoration: const PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w700,
      ),
      bodyTextStyle: TextStyle(fontSize: 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.all(24),
    ),
    footer: ElevatedButton(onPressed: () => {}, child: Text('Begin Setup'))
  );
}