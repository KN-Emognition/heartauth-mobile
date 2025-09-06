import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String? errorText;

  const ErrorScreen({super.key, this.errorText});

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 64,
            ),
            SizedBox(height: 16),
            Text(
              error ?? 'An unknown error occurred.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}