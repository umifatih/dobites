import 'package:flutter/material.dart';
import 'onboarding_page2.dart';
import '../auth/sign_in.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // latar utama sesuai desain (cokelat tua)
      backgroundColor: const Color(0xFF593412),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              // ────────── Logo kecil (atas) ──────────
              const SizedBox(height: 24),
              Center(
                child: Image.asset(
                  'assets/images/indikator_page1.png',
                  width: 96,
                  height: 43,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 48),

              // ────────── Ilustrasi utama ──────────
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/onboard_cookies.png',
                    width: 242,
                    height: 281,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // ────────── Judul ──────────
              Text(
                'Siapa yang ga suka hadiah?\nKita semua SUKA hadiah!!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  height: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // ────────── Deskripsi ──────────
              Text(
                'Kalau kamu kayak kami, pasti suka banget dapetin kejutan manis!\n'
                'Makanya, kami hadir dengan program loyalitas paling lezat di dunia cookies!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 48),

              // ────────── Tombol & Skip ──────────
              Row(
                children: [
                  // Skip
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const SignIn()),
                      );
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Selanjutnya
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const OnboardingPage2(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF7B658),
                      foregroundColor: const Color(0xFF593412),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    child: const Text(
                      'Selanjutnya',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
