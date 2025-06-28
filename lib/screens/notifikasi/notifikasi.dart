import 'package:flutter/material.dart';

class Notifikasi extends StatelessWidget {
  const Notifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Stack(
          children: [
            // Background wave
            Positioned.fill(
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  'assets/images/bg_pattern.png',
                  fit: BoxFit.cover,
                  alignment: Alignment.topRight,
                ),
              ),
            ),

            // Konten utama
            SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  _buildTabBar(),
                  Expanded(child: _buildTabBarView(context)),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFFCEDD6),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Row(
              children: const [
                Icon(Icons.arrow_back, color: Colors.black87, size: 20),
                SizedBox(width: 6),
                Text("Kembali", style: TextStyle(color: Colors.black87)),
              ],
            ),
          ),
          const Spacer(),
          const Text(
            "Notifikasi",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Spacer(flex: 2),
          const Icon(Icons.notifications, color: Colors.black87),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: const Color(0xFFFBE8DB),
      child: const TabBar(
        indicatorColor: Color(0xFFFF6B57),
        labelColor: Color(0xFFFF6B57),
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        tabs: [
          Tab(text: "Semua"),
          Tab(text: "Order"),
          Tab(text: "Promo"),
          Tab(text: "Sistem"),
        ],
      ),
    );
  }

  Widget _buildTabBarView(BuildContext context) {
    return TabBarView(
      children: List.generate(4, (_) => _buildEmptyNotifWidget(context)),
    );
  }

  Widget _buildEmptyNotifWidget(BuildContext context) {
    return Container(
      color: const Color(0xFFFFF5E9),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/notifikasi.png', // Pastikan sudah ada di asset
            width: 250,
          ),
          const SizedBox(height: 20),
          const Text(
            "Kamu sudah update nih",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Belum ada notifikasi untuk sekarang.\nKami akan memberi tahu kamu jika ada yang baru!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFFF6B57),
              side: const BorderSide(color: Color(0xFFFF6B57)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/home',
                (route) => false,
              );
            },
            child: const Text("Kembali"),
          ),
        ],
      ),
    );
  }
}
