import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/app_bottom_nav.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  static const peach = Color(0xFFFCEDD6);

  late final String _uid;
  late final Stream<QuerySnapshot> _orderStream;

  @override
  void initState() {
    super.initState();
    _uid = FirebaseAuth.instance.currentUser!.uid;
    _orderStream = FirebaseFirestore.instance
        .collection('users')
        .doc(_uid)
        .collection('orders')
        .orderBy('createdAt', descending: true)
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: peach,
      body: SafeArea(
        child: Stack(
          children: [
            // Pattern di seluruh layar
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/bg_full.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // ======== KONTEN LAMAN ========
            Column(
              children: [
                // ---------- HEADER GAMBAR + TEKS ----------
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 140, // sesuaikan tinggi jika perlu
                      child: Image.asset(
                        'assets/images/bg_screen.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          'Riwayat Pesanan',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                blurRadius: 6,
                                color: Colors.white.withAlpha(128),
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // ---------- DAFTAR RIWAYAT ----------
                Expanded(child: _buildContent()),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(current: 2),
    );
  }

  // ================= STREAMBUILDER =================
  Widget _buildContent() {
    return StreamBuilder<QuerySnapshot>(
      stream: _orderStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Gagal memuat riwayat'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data?.docs ?? [];
        if (docs.isEmpty) {
          return const Center(
            child: Text('Belum ada pesanan 🛒', style: TextStyle(fontSize: 16)),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: docs.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, i) => _OrderCard(data: docs[i]),
        );
      },
    );
  }
}

// ================= KARTU PESANAN =================
class _OrderCard extends StatelessWidget {
  final QueryDocumentSnapshot data;
  const _OrderCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final total = data['total'] ?? 0;
    final created = (data['createdAt'] as Timestamp).toDate();
    final items = List<Map<String, dynamic>>.from(data['items'] ?? []);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order# ${data.id.substring(0, 6).toUpperCase()}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            'Tanggal: ${created.day}/${created.month}/${created.year}',
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          ...items
              .take(3)
              .map((item) => Text('- ${item['name']} x${item['qty']}')),
          if (items.length > 3) const Text('...'),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Total: Rp$total',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
