import 'package:flutter/material.dart';
import 'package:hauth_mobile/widgets/lottie_animation.dart';
import 'package:hauth_mobile/generated/l10n.dart';

class UnsupportedScreen extends StatelessWidget {
  const UnsupportedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 16,
          children: [
            LottieAnimation('assets/animations/failed.json'),
            Text(
              S.of(context).unsupportedscreen_unsupported_device,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
