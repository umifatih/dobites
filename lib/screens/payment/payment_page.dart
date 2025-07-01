import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dobites/models/order_model.dart';
import 'package:dobites/services/order_storage.dart';
import 'package:provider/provider.dart';
import 'package:dobites/providers/cart_provider.dart';

class PaymentPage extends StatefulWidget {
  final String paymentMethod;
  final String paymentDetail;
  final int totalPrice;
  final int discount;
  final String paymentId;
  final String address;
  final int shippingFee;
  final int serviceFee;

  const PaymentPage({
    super.key,
    required this.paymentMethod,
    required this.paymentDetail,
    required this.totalPrice,
    required this.discount,
    required this.paymentId,
    required this.address,
    required this.shippingFee,
    required this.serviceFee,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Duration remaining = const Duration(seconds: 30);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining.inSeconds == 0) {
        timer.cancel();
        _showPaymentDialog(success: false);
      } else {
        setState(() => remaining -= const Duration(seconds: 1));
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _showPaymentDialog({required bool success}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              success ? Icons.check_circle : Icons.timelapse,
              color: success ? Colors.green : Colors.orange,
              size: 56,
            ),
            const SizedBox(height: 12),
            Text(
              success ? 'Pembayaran Berhasil' : 'Waktu Habis',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              success
                  ? 'Pembayaran kamu berhasil dikonfirmasi!'
                  : 'Waktu pembayaran telah habis. Silakan coba lagi.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4B2C20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text(
                "Belanja Lagi",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountdown() {
    final h = remaining.inHours.toString().padLeft(2, '0');
    final m = (remaining.inMinutes % 60).toString().padLeft(2, '0');
    final s = (remaining.inSeconds % 60).toString().padLeft(2, '0');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _countBox(h, 'Jam'),
        _countBox(m, 'Menit'),
        _countBox(s, 'Detik'),
      ],
    );
  }

  Widget _countBox(String value, String label) => Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 10)),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final int finalTotal =
        widget.totalPrice +
        widget.serviceFee +
        widget.shippingFee -
        widget.discount;

    return Scaffold(
      backgroundColor: const Color(0xFFFCEDD6),
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
              _buildHeaderWave(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCountdown(),
                      const SizedBox(height: 16),

                      if (widget.paymentMethod == 'qris') ...[
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.brown.shade100),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              'assets/images/qris_example.png',
                              width: 250,
                              height: 250,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      _buildSectionTitle("Alamat Pengiriman"),
                      _buildCard(
                        icon: Icons.home,
                        title: "Alamat Saya",
                        subtitle: widget.address,
                      ),
                      const SizedBox(height: 16),

                      _buildSectionTitle("Metode Pembayaran"),
                      _buildCard(
                        icon: Icons.payment,
                        title: _getPaymentMethodLabel(),
                        subtitle: widget.paymentDetail,
                        rightText: _getPaymentMethodTag(),
                      ),
                      const SizedBox(height: 16),

                      _buildSectionTitle("Detail Pembayaran"),
                      _buildPriceRow("Subtotal", widget.totalPrice),
                      _buildPriceRow("Biaya Layanan", widget.serviceFee),
                      _buildPriceRow("Ongkir", widget.shippingFee),
                      _buildPriceRow("Diskon Voucher", -widget.discount),
                      const Divider(),
                      _buildPriceRow("Total Bayar", finalTotal, bold: true),

                      const SizedBox(height: 20),

                      _buildGuideSection(),
                      const SizedBox(height: 20),
                      _buildSecureNotice(),
                      const SizedBox(height: 12),
                      _buildPaymentSummary(widget.paymentId, finalTotal),
                      const SizedBox(height: 20),

                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4B2C20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () async {
                            _timer?.cancel();

                            final cartProvider = context.read<CartProvider>();
                            final items = cartProvider.items.values
                                .map(
                                  (e) => {
                                    'id': e.product.id,
                                    'name': e.product.name,
                                    'image': e.product.imageUrl,
                                    'qty': e.quantity,
                                    'price': e.product.price,
                                    'paymentId': widget.paymentId,
                                    'paymentMethod': widget.paymentMethod,
                                    'paymentDetail': widget.paymentDetail,
                                    'address': widget.address,
                                    'discount': widget.discount,
                                    'finalTotal': finalTotal,
                                  },
                                )
                                .toList();

                            final order = Order(
                              date: DateTime.now().toIso8601String(),
                              items: items,
                              total: finalTotal,
                              status: 'Dikirim',
                              paymentId: widget.paymentId,
                              paymentMethod: widget.paymentMethod,
                              discount: widget.discount,
                              shippingFee: widget.shippingFee,
                              serviceFee: widget.serviceFee,
                            );

                            await OrderStorage.saveOrder(order);
                            cartProvider.clear();
                            _showPaymentDialog(success: true);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 14,
                            ),
                            child: Text(
                              "Bayar Sekarang",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
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

  Widget _buildSectionTitle(String title) => Text(
    title,
    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
  );

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
    String? rightText,
  }) => Container(
    margin: const EdgeInsets.only(top: 6),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.brown),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        if (rightText != null)
          Text(rightText, style: const TextStyle(color: Colors.orange)),
      ],
    ),
  );

  Widget _buildPriceRow(String label, int value, {bool bold = false}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(fontWeight: bold ? FontWeight.bold : null),
            ),
            Text(
              "Rp$value",
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : null,
                color: bold ? Colors.green : null,
              ),
            ),
          ],
        ),
      );

  Widget _buildGuideSection() {
    if (widget.paymentMethod == 'bank') {
      return _buildGuide([
        "Transfer ke No. Rekening: 218097125081234 (a.n. DOBITES SHOP)",
        "Bank: BCA",
        "Lakukan pembayaran sesuai total tagihan.",
        "Simpan bukti transfer dan tunggu konfirmasi.",
      ]);
    } else if (widget.paymentMethod == 'wallet') {
      return _buildGuide([
        "Buka aplikasi E-Wallet kamu.",
        "Masukkan nomor: 218097125081234",
        "Lakukan pembayaran dan simpan bukti transfer.",
      ]);
    } else if (widget.paymentMethod == 'cod') {
      return _buildGuide([
        "Siapkan uang tunai dengan nominal yang sesuai.",
        "Berikan kepada kurir saat pesanan diterima.",
      ]);
    } else {
      return const SizedBox.shrink(); // QRIS tidak pakai panduan lagi karena ada gambar
    }
  }

  Widget _buildGuide(List<String> steps) => Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.brown.shade100),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: steps
          .asMap()
          .entries
          .map(
            (entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text("${entry.key + 1}. ${entry.value}"),
            ),
          )
          .toList(),
    ),
  );

  Widget _buildSecureNotice() => Row(
    children: const [
      Icon(Icons.verified_user, color: Colors.green),
      SizedBox(width: 8),
      Expanded(
        child: Text(
          "Pembayaran Anda aman\nHanya ditagih saat barang diterima.",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ),
    ],
  );

  Widget _buildPaymentSummary(String id, int total) => Container(
    margin: const EdgeInsets.only(top: 16),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "ID Pembayaran",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
            ),
            Text(id, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              "Total Bayar",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              "Rp$total",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );

  Widget _buildHeaderWave(BuildContext context) => Stack(
    children: [
      Container(
        height: 140,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    SizedBox(width: 6),
                    Text("Kembali", style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              const Spacer(),
              const Text(
                "Pembayaran",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    ],
  );

  String _getPaymentMethodLabel() {
    switch (widget.paymentMethod) {
      case 'cod':
        return 'Bayar di Tempat';
      case 'bank':
        return 'Transfer Bank';
      case 'wallet':
        return 'E-Wallet';
      case 'qris':
        return 'QRIS';
      default:
        return 'Metode Tidak Dikenal';
    }
  }

  String _getPaymentMethodTag() {
    switch (widget.paymentMethod) {
      case 'cod':
        return 'Tunai';
      case 'bank':
        return 'BCA';
      case 'wallet':
        return 'GoPay';
      case 'qris':
        return 'Pindai QR';
      default:
        return '';
    }
  }
}
