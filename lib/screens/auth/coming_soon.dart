import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final String provider;

  const ComingSoon({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF7B5347);
    const peach = Color(0xFFFCEDD6);

    return Scaffold(
      backgroundColor: peach,
      appBar: AppBar(
        title: Text('Login dengan $provider'),
        backgroundColor: brown,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon indikator
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withAlpha((0.95 * 255).toInt()),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.access_time_filled_rounded,
                  size: 48,
                  color: brown,
                ),
              ),
              const SizedBox(height: 32),

              // Judul utama
              Text(
                '$provider Login\nAkan Segera Hadir',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF121926),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Teks deskripsi
              const Text(
                'Kami sedang mempersiapkan fitur ini. Silakan gunakan metode lain untuk masuk sementara waktu.',
                style: TextStyle(fontSize: 16, color: Color(0xFF364152)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Tombol kembali
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brown,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: const Text(
                    'Kembali ke Masuk',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
