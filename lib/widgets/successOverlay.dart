import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessAnimationOverlay extends StatefulWidget {
  final String nextRoute;

  const SuccessAnimationOverlay({Key? key, required this.nextRoute})
      : super(key: key);

  @override
  _SuccessAnimationOverlayState createState() =>
      _SuccessAnimationOverlayState();
}

class _SuccessAnimationOverlayState extends State<SuccessAnimationOverlay> {
  @override
  void initState() {
    super.initState();

    // Wait for the animation, then go to next screen
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(widget.nextRoute);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Lottie.asset(
            'assets/animations/success.json',
            repeat: false,
            width: 120,
            height: 120,
          ),
        ),
      ),
    );
  }
}
