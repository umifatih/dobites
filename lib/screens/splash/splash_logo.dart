import 'package:flutter/material.dart';

import '../onboarding/onboarding_page1.dart';

/// Splash logo (cookies) – tampil 5 detik:
///   • Hadir via transisi fade (dari splash sebelumnya)
///   • Setelah 5 detik, hilang via transisi fade dan masuk onboarding.
class SplashLogoPage extends StatelessWidget {
  const SplashLogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Pindah ke onboarding setelah 5 detik dengan transisi fade.
    Future.delayed(const Duration(seconds: 5), () {
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const Onboarding(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF59340B), // cokelat latar
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/cookies.png', width: 180),
            const SizedBox(height: 24),
            Image.asset('assets/images/logo_text.png', width: 220),
          ],
        ),
      ),
    );
  }
}
