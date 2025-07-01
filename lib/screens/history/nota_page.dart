import 'package:flutter/material.dart';
import '../../models/order_model.dart';

class NotaPage extends StatelessWidget {
  const NotaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Order order = ModalRoute.of(context)!.settings.arguments as Order;
    final item = order.items.isNotEmpty ? order.items[0] : {};
    final dateTime = DateTime.parse(order.date);
    final time =
        "${dateTime.hour.toString().padLeft(2, '0')}.${dateTime.minute.toString().padLeft(2, '0')}";

    return Scaffold(
      backgroundColor: const Color(0xFFFCEDD6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCEDD6),
        elevation: 0,
        title: const Text('Terima Kasih', style: TextStyle(color: Colors.teal)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoRow("ID Transaksi", item['paymentId'] ?? "-"),
              _infoRow(
                "Tanggal",
                "${dateTime.day} ${_getMonth(dateTime.month)} ${dateTime.year}",
              ),
              _infoRow("Waktu", time),
              const Divider(height: 24),
              const Text(
                "Pesanan",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...order.items.map(
                (e) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(e['name'] ?? "-")),
                    Text("x${e['qty']}"),
                    Text("Rp ${e['price']}"),
                  ],
                ),
              ),
              const Divider(height: 24),
              const Text(
                "Rincian",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _infoRow("Total", "Rp ${order.total}"),
              _infoRow("Metode Pembayaran", item['paymentMethod'] ?? "-"),
              _infoRow("Waktu Pengambilan", "10.00"),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4B2C20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Lacak Pesanan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  String _getMonth(int month) {
    const months = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember",
    ];
    return months[month - 1];
  }
}
