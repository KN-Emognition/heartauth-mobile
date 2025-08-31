import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Page1 extends PageViewModel {
  Page1()
  : super(
      title: "Welcome to HAuth",
      body: "Your gateway to seamless connectivity and productivity.",
      image: Center(
        child: SvgPicture.asset(
          '/assets/hauth_logo.svg',
          width: 250,
          height: 250,
          semanticsLabel: 'HAuth Logo',
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
    );
}