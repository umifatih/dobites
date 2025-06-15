import 'package:flutter/material.dart';
import '../auth/sign_in.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

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
                  'assets/images/indikator_page3.png', // sesuaikan nama file logo kecil
                  width: 137,
                  height: 43,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 48),

              // ─── Ilustrasi utama ───
              Expanded(
                child: Center(
                  child: Image.asset(
                    'assets/images/onboard_cake.png', // ilustrasi kue
                    width: MediaQuery.of(context).size.width * 0.6,
                    fit: BoxFit.contain,
                    semanticLabel: 'Ilustrasi kue ulang tahun',
                  ),
                ),
              ),

              // ─── Judul ───
              Text(
                'Hari seru dengan kue spesial!\nDapetin keseruannya!!',
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
                'Biar kayak ulang tahun tiap minggu, kami siap bagi-bagi hadiah '
                'lewat program loyalitas.\nAwas, bisa ketagihan manisnya! 🎉🍰',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 48),

              // ─── Tombol Mulai (Skip dihapus) ───
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const SignIn()),
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
                      'Mulai',
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
