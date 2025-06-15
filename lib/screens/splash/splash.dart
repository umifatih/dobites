import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ← ini penting
import 'package:lottie/lottie.dart';

import 'splash_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Set fullscreen (hilangkan status bar sementara)
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    // Timer pindah ke logo
    Future.delayed(const Duration(seconds: 10), () {
      if (!mounted) return;

      // Kembalikan UI normal saat keluar splash
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SplashLogoPage(),
          transitionDuration: const Duration(milliseconds: 700),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox.expand(
        child: ColoredBox(
          color: Colors.black, // latar belakang saat loading animasi
          child: Center(child: LottieWidget()),
        ),
      ),
    );
  }
}

class LottieWidget extends StatelessWidget {
  const LottieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/splash.json',
      repeat: true,
      fit: BoxFit.contain,
    );
  }
}
