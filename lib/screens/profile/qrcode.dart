import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({super.key});

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  int _selectedTab = 0;
  String? _name;
  String? _email;
  String? _photoUrl;
  bool _loading = true;

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
        _email = data?['email'] ?? user.email ?? '-';
        _photoUrl = data?['photoUrl']; // Ambil dari Firestore
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Gagal memuat data: $e')));
    }
  }

  Future<void> _pickQrImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'QR dari galeri dipilih (fitur scan belum diimplementasikan).',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF7B5347);
    const peach = Color(0xFFFCEDD6);

    return Scaffold(
      backgroundColor: peach,
      appBar: AppBar(
        backgroundColor: brown,
        foregroundColor: Colors.white,
        title: const Text('QR code'),
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            decoration: const BoxDecoration(
              color: peach,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTab("Kode saya", 0),
                const SizedBox(width: 20),
                _buildTab("Scan Kode", 1),
              ],
            ),
          ),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _selectedTab == 0
          ? _buildMyQrCode()
          : _buildScannerPlaceholder(),
    );
  }

  Widget _buildTab(String label, int index) {
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              color: _selectedTab == index ? Colors.brown : Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (_selectedTab == index)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 60,
              color: Colors.brown,
            ),
        ],
      ),
    );
  }

  Widget _buildMyQrCode() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          _photoUrl != null && _photoUrl!.isNotEmpty
              ? CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(_photoUrl!),
                )
              : const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Color(0xFF7B5347), size: 30),
                ),
          const SizedBox(height: 10),
          Text(
            _name ?? '-',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            _email ?? '-',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFE6CEB5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset('assets/images/sample_qr.png', width: 180),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerPlaceholder() {
    return Center(
      child: ElevatedButton(
        onPressed: _pickQrImage,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.brown),
        child: const Text(
          "Pilih gambar QR dari galeri",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
