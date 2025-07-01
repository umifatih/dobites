import 'package:flutter/material.dart';
import '../widgets/app_bottom_nav.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BantuanPage extends StatelessWidget {
  static const brown = Color(0xFF7B5347);
  static const peach = Color(0xFFFCEDD6);

  const BantuanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: peach,
      bottomNavigationBar: const AppBottomNav(current: 3),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.25,
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
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Support',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: brown,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text('Laporkan kendala kamu ke kami yaa!!'),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          _buildContactCard(
                            Icons.call,
                            'Nomor',
                            '+62 85601778422',
                          ),
                          _buildContactCard(
                            FontAwesomeIcons.whatsapp,
                            'Nomor WhatsApp',
                            '+62 85601778422',
                          ),
                          _buildContactCard(
                            Icons.language,
                            'Website',
                            'dobites.co',
                          ),
                          _buildContactCard(
                            Icons.email_outlined,
                            'Email',
                            'dobites@gmail.com',
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 77, 37, 17),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Laporkan'),
                            const SizedBox(height: 4),
                            const Text(
                              'Atau kamu mau langsung berbicara dengan kami?',
                            ),
                            const SizedBox(height: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                  0xFF7B5347,
                                ), // warna coklat
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 14,
                                ),
                              ),
                              onPressed: () {
                                // aksi saat diklik, misal buka dialog atau panggilan
                              },
                              child: const Text(
                                "Laporkan dan berdiskusi",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Color(0x1FFF6B57),
                          child: Icon(Icons.question_mark, color: brown),
                        ),
                        title: const Text('FAQ'),
                        subtitle: const Text('Pertanyaan'),
                        onTap: () {
                          Navigator.pushNamed(context, '/faq');
                        },
                      ),
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
                      "Bantuan",
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

  Widget _buildContactCard(IconData icon, String label, String value) {
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
