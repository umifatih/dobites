import 'package:flutter/material.dart';

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Pribadi'),
        backgroundColor: const Color(0xFF4B2C20),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Nama: Arion"),
            SizedBox(height: 10),
            Text("Email: arion@gmail.com"),
            SizedBox(height: 10),
            Text("Nomor HP: 081234567890"),
            // Tambahkan form edit jika ingin bisa diubah
          ],
        ),
      ),
    );
  }
}
