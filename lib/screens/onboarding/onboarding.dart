import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Onboarding')),
      body: const Center(
        child: Text(
          'Ini halaman Onboarding 🤗',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
