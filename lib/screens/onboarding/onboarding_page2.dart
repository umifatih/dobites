import 'package:flutter/material.dart';
import 'onboarding_page3.dart';
import '../auth/sign_in.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF593412),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              // ─── Logo kecil ───
              const SizedBox(height: 24),
              Center(
                child: Image.asset(
                  'assets/images/indikator_page2.png', // ganti sesuai aset logo kecil slide 2
                  width: 117,
                  height: 43,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 48),

              // ─── Ilustrasi utama ───
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/onboard_cupcake.png', // ilustrasi cupcake
                    width: MediaQuery.of(context).size.width * 0.6,
                    fit: BoxFit.contain,
                    semanticLabel: 'Ilustrasi cupcake',
                  ),
                ),
              ),

              // ─── Judul ───
              Text(
                'Cupcake itu kecil, manis, dan selalu siap bikin mood naik!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  height: 1.3,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // ─── Deskripsi ───
              Text(
                'Makanya, tiap kamu login, kami siap kasih reward yang seimut '
                'cupcake favorit kamu. Karena kamu pantas dimanjain! ✨🧁',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 48),

              // ─── Tombol & Skip ───
              Row(
                children: [
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const OnboardingPage3(),
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
