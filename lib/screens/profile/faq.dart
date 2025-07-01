import 'package:flutter/material.dart';
import '../widgets/app_bottom_nav.dart';

class FAQPage extends StatelessWidget {
  static const brown = Color(0xFF7B5347);
  static const peach = Color(0xFFFCEDD6);

  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: peach,
      bottomNavigationBar: const AppBottomNav(current: 3),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'assets/images/bg_full.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              _buildWaveHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pertanyaan yang Sering Diajukan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: brown,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text('Terakhir diperbarui 8 Mei 2025'),
                      const SizedBox(height: 16),
                      _buildFAQItem(
                        'Bagaimana cara memesan produk?',
                        'Pilih produk, tentukan varian, klik "Tambah ke Keranjang", lalu lanjutkan ke checkout.',
                      ),
                      _buildFAQItem(
                        'Metode pembayaran apa saja yang tersedia?',
                        'Kami menerima pembayaran melalui e-wallet, transfer bank, dan kartu kredit.',
                      ),
                      _buildFAQItem(
                        'Bagaimana cara melacak pesanan saya?',
                        'Masuk ke menu Riwayat dan pilih pesanan yang ingin Anda lacak.',
                      ),
                      _buildFAQItem(
                        'Apakah saya bisa membatalkan pesanan?',
                        'Pesanan dapat dibatalkan maksimal 10 menit setelah dibuat.',
                      ),
                      _buildFAQItem(
                        'Berapa lama pengiriman produk?',
                        'Waktu pengiriman bervariasi antara 1-3 hari kerja tergantung lokasi.',
                      ),
                      _buildFAQItem(
                        'Bagaimana cara mengembalikan produk?',
                        'Hubungi tim CS kami dalam waktu 3 hari setelah menerima produk.',
                      ),
                      _buildFAQItem(
                        'Di mana saya bisa menemukan voucher saya?',
                        'Voucher dapat ditemukan di halaman profil Anda di bagian "Voucher Saya".',
                      ),
                      _buildFAQItem(
                        'Mengapa voucher saya tidak bisa digunakan?',
                        'Pastikan Anda telah memenuhi syarat penggunaan voucher.',
                      ),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          'Masih ada pertanyaan yang belum terjawab?',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF7B5347),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 14,
                            ),
                          ),
                          onPressed: () {
                            // aksi saat diklik
                          },
                          child: const Text(
                            "Laporkan dan berdiskusi",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWaveHeader(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_pattern.png'),
              fit: BoxFit.cover,
              alignment: Alignment.topRight,
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
            child: SizedBox(
              height: 60,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back, color: Colors.white, size: 20),
                          SizedBox(width: 6),
                          Text("FAQ", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Voucher",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        question,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: Text(
            answer,
            style: const TextStyle(fontSize: 13, color: Colors.black87),
          ),
        ),
      ],
    );
  }
}
