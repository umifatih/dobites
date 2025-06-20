// lib/widgets/app_bottom_nav.dart
import 'package:flutter/material.dart';
import '../home/home.dart';
import '../catalog/catalog.dart';
import '../history/history.dart';
import '../profile/profile.dart';

class AppBottomNav extends StatelessWidget {
  /// indeks tab yang sedang aktif; 0 = Home, 1 = Menu, dst.
  final int current;
  const AppBottomNav({super.key, required this.current});

  static const brown = Color(0xFF7B5347);

  void _onTap(BuildContext context, int i) {
    if (i == current) return; // sudah di tab yg sama
    switch (i) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Home()),
        );
        break;
      case 1:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const CatalogPage()),
        );
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HistoryPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ProfilePage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: current,
      onTap: (i) => _onTap(context, i),
      type: BottomNavigationBarType.fixed,
      backgroundColor: brown,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black87,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Menu'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profil',
        ),
      ],
    );
  }
}
