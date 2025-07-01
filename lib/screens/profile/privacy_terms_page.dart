import 'package:flutter/material.dart';
import '../widgets/app_bottom_nav.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyTermsPage extends StatelessWidget {
  static const brown = Color(0xFF7B5347);
  static const peach = Color(0xFFFCEDD6);

  const PrivacyTermsPage({super.key});

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
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle("Privasi dan Ketentuan"),
                      _lastUpdate(),
                      const SizedBox(height: 12),
                      _numberedText(
                        "1. Pengumpulan Data",
                        "Kami mengumpulkan info pribadi yang kamu berikan saat daftar, pesan dessert, atau hubungi kami. Biasanya ini termasuk nama, alamat, email, dan info pembayaran.",
                      ),
                      _numberedText(
                        "2. Bagaimana Data kamu digunakan",
                        "Data kamu kami pakai buat proses pesanan, bantu kamu lewat layanan pelanggan, kasih pengalaman belanja yang lebih personal, dan kirim info promo atau update akun (kalau kamu berlangganan).",
                      ),
                      _numberedText(
                        "3. Berbagi Data",
                        "Tenang, kami nggak jual data pribadi kamu. Data kamu cuma dibagi ke partner pengiriman atau pembayaran yang bantu selesaikan pesanan kamu.",
                      ),
                      _numberedText(
                        "4. Keamanan",
                        "Kami berusaha banget buat jaga data kamu tetap aman. Perlu diingat, nggak ada sistem online yang 100% bebas risiko.",
                      ),
                      _numberedText(
                        "5. Cookies",
                        "Aplikasi kami mungkin pakai cookie dan alat pelacak buat bikin pengalaman kamu lebih oke dan ngecek performa aplikasi. Kamu bisa atur preferensinya di pengaturan browser.",
                      ),
                      _numberedText(
                        "6. Hak Kamu",
                        "Kamu punya hak buat lihat, ubah, atau hapus data pribadi kamu. Cukup hubungi tim kami, ya!",
                      ),
                      _numberedText(
                        "7. Hubungi Kami",
                        "Punya pertanyaan soal kebijakan privasi ini? Langsung aja hubungi kami di:",
                      ),
                      _numberedText(
                        "8. Persetujuan Syarat Penggunaan",
                        "Dengan menggunakan aplikasi kami, kamu setuju untuk mengikuti semua syarat yang berlaku. Kalau ada yang nggak kamu setujui, sebaiknya jangan lanjut pakai aplikasinya, ya.",
                      ),
                      _numberedText(
                        "9. Akun & Syarat Umur",
                        "Kamu harus berusia minimal 18 tahun untuk bikin akun dan belanja di aplikasi ini. Jaga baik-baik info login kamu biar tetap aman.",
                      ),
                      _numberedText(
                        "10. Pemesanan & Pembayaran",
                        "Semua pesanan tergantung ketersediaan dan konfirmasi. Kami bisa batalkan pesanan kalau ada masalah stok, pembayaran, atau sistem error. Metode pembayaran yang bisa dipakai: kartu kredit/debit, dan e-wallet.",
                      ),
                      _numberedText(
                        "11. Pengiriman",
                        "Estimasi waktu kirim akan ditampilkan saat checkout. Tapi, bisa aja pengiriman terlambat karena lokasi atau kondisi logistik. Kalau ada delay, kami bakal kasih info ke kamu.",
                      ),
                      _numberedText(
                        "12. Pengembalian & Refund",
                        "Pengembalian dan refund berlaku sesuai kebijakan kami. Barang yang mau dikembalikan harus diajukan dalam 7 hari setelah diterima.",
                      ),
                      _numberedText(
                        "13. Perilaku Pengguna",
                        "Kami harap kamu nggak menyalahgunakan aplikasi ini, mengunggah konten berbahaya, atau mengganggu kenyamanan pengguna lain.",
                      ),
                      _numberedText(
                        "14. Hubungi Kami",
                        "Punya pertanyaan soal kebijakan privasi ini? Langsung aja hubungi kami di:",
                      ),
                      _buildContactRow(),

                      const SizedBox(height: 40),
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
                          Text(
                            "Kembali",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Privasi & Ketentuan",
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

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: brown,
      ),
    );
  }

  Widget _lastUpdate() {
    return const Padding(
      padding: EdgeInsets.only(top: 4, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('Update terakhir'), Text('8 Mei 2025')],
      ),
    );
  }

  Widget _numberedText(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildContactRow() {
    return Column(
      children: [
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _contactCard(Icons.call, "Nomor", "+62 85601778422"),
            _contactCard(
              FontAwesomeIcons.whatsapp,
              "Nomor WhatsApp",
              "+62 85601778422",
            ),
            _contactCard(Icons.language, "Website", "Dobites.co"),
            _contactCard(Icons.email_outlined, "Email", "dobites@gmail.com"),
          ],
        ),
      ],
    );
  }

  Widget _contactCard(IconData icon, String label, String value) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color.fromARGB(255, 77, 37, 17)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFFFFE1DD),
            child: Icon(icon, color: brown, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
}
