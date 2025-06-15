import 'dart:async';
import 'package:flutter/material.dart';
import '../onboarding/onboarding.dart';

class SplashLogoPage extends StatefulWidget {
  const SplashLogoPage({super.key});

  @override
  State<SplashLogoPage> createState() => _SplashLogoPageState();
}

class _SplashLogoPageState extends State<SplashLogoPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 600),
  );

  @override
  void initState() {
    super.initState();

    // Fade-in
    _controller.forward();

    // Total 5 detik: tunggu 4,4 s lalu jalankan fade-out (0,6 s)
    Future.delayed(const Duration(milliseconds: 4400), () {
      _controller.reverse();
    });

    // Setelah 5 detik pindah ke onboarding
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const OnboardingPage(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF59340B), // coklat dari desain
      body: Center(
        child: FadeTransition(
          opacity: _controller,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/cookies.png', width: 180),
              const SizedBox(height: 24),
              Image.asset('assets/images/logo_text.png', width: 220),
            ],
          ),
        ),
      ),
    );
  }
}
