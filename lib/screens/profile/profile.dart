import 'package:flutter/material.dart';

// Widget bottom-nav yang sudah direuse
import '../widgets/app_bottom_nav.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const brown = Color(0xFF7B5347);
  static const peach = Color(0xFFFCEDD6);

  // Dummy controller buat teks contoh
  String textField1 = '';
  String textField2 = '';
  String textField3 = '';
  String textField4 = '';
  String textField5 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: peach,
      body: SafeArea(
        child: Stack(
          children: [
            // Background pattern
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
                // ===== HEADER GAMBAR + TULISAN "PROFIL" =====
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 140,
                      child: Image.asset(
                        'assets/images/bg_screen.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          'Profil',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 6,
                                color: Colors.white.withAlpha(242),
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // ===== ISI PROFIL =====
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 32),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              backgroundImage: const NetworkImage(
                                'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/mg7vua9c_expires_30_days.png',
                              ),
                            ),
                            Positioned(
                              bottom: 4,
                              right: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: brown,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Nama Pengguna',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'email@contoh.com',
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 32),
                        _buildTextField(
                          'Nama Lengkap',
                          (v) => setState(() => textField1 = v),
                        ),
                        _buildTextField(
                          'No. Telepon',
                          (v) => setState(() => textField2 = v),
                        ),
                        _buildTextField(
                          'Alamat',
                          (v) => setState(() => textField3 = v),
                          maxLines: 3,
                        ),
                        _buildTextField(
                          'Kota',
                          (v) => setState(() => textField4 = v),
                        ),
                        _buildTextField(
                          'Kode Pos',
                          (v) => setState(() => textField5 = v),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: brown,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Simpan',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(current: 3),
    );
  }

  Widget _buildTextField(
    String label,
    Function(String) onChanged, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        onChanged: onChanged,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
