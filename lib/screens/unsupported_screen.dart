import 'package:flutter/material.dart';
import 'package:hauth_mobile/widgets/lottie_animation.dart';

class UnsupportedScreen extends StatelessWidget {
  const UnsupportedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          spacing: 16,
          children: [
            LottieAnimation('assets/animations/failed.json'),
            Text(
              'This device is not supported.',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
