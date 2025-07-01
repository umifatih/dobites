import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../setting/personal_info_page.dart';
import '../notifikasi/notifikasi.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/cart_icon_badge.dart';
import 'privacy_terms_page.dart';
import '../auth/sign_in.dart';
import 'informasi_pribadi_page.dart';
import 'qrcode.dart'; // arahkan ke lokasi file kamu

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const brown = Color(0xFF7B5347);
  static const peach = Color(0xFFFCEDD6);

  String? _name;
  String? _email;
  bool _isUserLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  Future<void> _loadUserInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      final data = doc.data();

      setState(() {
        _name = data?['name'] ?? 'Pengguna';
        _email = data?['email'] ?? user.email ?? '';
        _isUserLoading = false;
      });
    } catch (e) {
      setState(() => _isUserLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gagal memuat data profil: $e')));
    }
  }

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
          SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                _buildUserInfo(),
                const SizedBox(height: 8),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildAppSettingsTitle(),
                        _buildSettingsCard(),
                        _buildOtherSectionTitle(),
                        _buildOtherCard(),
                        _buildLogoutButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Container(height: 4, color: brown),
        Container(
          color: Colors.white.withAlpha(242),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  size: 28,
                  color: Colors.black87,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const Notifikasi()),
                  );
                },
              ),
              Image.asset('assets/images/cookies.png', width: 36, height: 36),
              CartIconWithBadge(
                onPressed: () => Navigator.pushNamed(context, '/cart'),
                icon: Icons.shopping_cart_outlined,
              ),
            ],
          ),
        ),
        Container(height: 4, color: brown),
      ],
    );
  }

  Widget _buildUserInfo() {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: double.infinity,
            color: brown,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        }

        final data = snapshot.data?.data() as Map<String, dynamic>?;

        final name = data?['name'] ?? 'Pengguna';
        final email =
            data?['email'] ?? FirebaseAuth.instance.currentUser?.email ?? '-';

        return Container(
          width: double.infinity,
          color: brown,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
                child: Icon(Icons.person, color: brown, size: 30),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: const TextStyle(
                        color: Color(0xFFE9EDF7),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.qr_code, color: Colors.white, size: 28),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const QRCodePage()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAppSettingsTitle() => const Padding(
    padding: EdgeInsets.only(left: 13, top: 16),
    child: Text(
      "Pengaturan Aplikasi",
      style: TextStyle(color: Color(0xFF2B4F6E), fontSize: 12),
    ),
  );

  Widget _buildOtherSectionTitle() => const Padding(
    padding: EdgeInsets.only(left: 13, top: 24, bottom: 12),
    child: Text(
      "Lainnya",
      style: TextStyle(color: Color(0xFF2B4F6E), fontSize: 12),
    ),
  );

  Widget _buildSettingsCard() {
    return _buildCard([
      _settingItem(
        Icons.person,
        "Informasi Pribadi",
        "Lihat dan ubah data akunmu",
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const InformasiPribadiPage()),
          );

          if (result == 'updated' && mounted) {
            setState(() {}); // Reload ulang FutureBuilder di _buildUserInfo
          }
        },
      ),
      _settingItem(
        Icons.card_giftcard,
        "Voucher",
        "Lihat kupon dan promo",
        onTap: () {
          Navigator.pushNamed(context, '/voucher');
        },
      ),
      _settingItem(
        Icons.location_on_outlined,
        "Alamat",
        "Daftar alamat pengirimanmu",
        onTap: () {
          Navigator.pushNamed(context, '/address');
        },
      ),
      _settingItem(
        Icons.privacy_tip_outlined,
        "Privasi & Keamanan",
        "Perlindungan data & akunmu",
        onTap: () {
          Navigator.pushNamed(context, '/privacytermspage');
        },
      ),
      _settingItem(
        Icons.lock_outline,
        "Ganti Password",
        "Atur kembali password akun",
        onTap: () {
          Navigator.pushNamed(context, '/change-password');
        },
      ),
    ]);
  }

  Widget _buildOtherCard() {
    return _buildCard([
      _settingItem(
        Icons.help_outline,
        "Bantuan",
        "Pusat panduan pengguna",
        onTap: () {
          Navigator.pushNamed(context, '/help');
        },
      ),
      _settingItem(
        Icons.info_outline,
        "Version",
        "1.0.1",
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Versi Aplikasi"),
              content: const Text(
                "Aplikasi Dobites\nVersion 1.0.1\nDiperbarui: 30 Juni 2025",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Tutup"),
                ),
              ],
            ),
          );
        },
      ),
    ]);
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: brown,
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          icon: const Icon(Icons.logout, color: Colors.white),
          label: const Text("Keluar", style: TextStyle(color: Colors.white)),
          onPressed: () async {
            final confirm = await showDialog<bool>(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text("Konfirmasi"),
                content: const Text(
                  "Apakah kamu yakin ingin keluar dari aplikasi?",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(ctx, false),
                    child: const Text("Batal"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(ctx, true),
                    child: const Text("Keluar"),
                  ),
                ],
              ),
            );

            if (confirm == true) {
              await FirebaseAuth.instance.signOut();
              if (!mounted) return;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const SignIn()),
                (route) => false,
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x40000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _settingItem(
    IconData icon,
    String title,
    String subtitle, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: brown.withOpacity(0.1),
              child: Icon(icon, size: 20, color: brown),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF404040),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Color(0xFF999999),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
