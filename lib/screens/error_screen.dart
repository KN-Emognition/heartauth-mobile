import 'package:flutter/material.dart';
import 'package:hauth_mobile/widgets/lottie_animation.dart';
import 'package:hauth_mobile/generated/l10n.dart';

class ErrorScreen extends StatelessWidget {
  final String? errorText;

  const ErrorScreen({super.key, this.errorText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    String? error = errorText;
    if(error == null) {
      // pull the error text from the arguments
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if(args == null || !args.containsKey('errorText')) {
        throw Exception('No error text provided');
      }
      error = args['errorText'] as String?;
    }
    return Scaffold(
      backgroundColor: theme.surface,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieAnimation('assets/animations/failed.json'),
            SizedBox(height: 16),
            Text(
              error ?? S.of(context).errorscreen_generic_error,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: theme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}