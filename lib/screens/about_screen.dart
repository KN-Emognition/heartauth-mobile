import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HAuth Mobile'),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}