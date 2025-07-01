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

  const PaymentPage({
    super.key,
    required this.paymentMethod,
    required this.paymentDetail,
    required this.totalPrice,
    required this.discount,
    required this.paymentId,
    required this.address,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Duration remaining = const Duration(seconds: 30); // 5 minutes
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
        setState(() => remaining = remaining - const Duration(seconds: 1));
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
              success ? Icons.check_circle_rounded : Icons.timelapse_rounded,
              color: success ? Colors.green : Colors.orange,
              size: 56,
            ),
            const SizedBox(height: 12),
            Text(
              success ? 'Payment Success' : 'Payment Time Out',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text(
                'Belanja Lagi', // atau 'Coba Lagi'
                style: TextStyle(color: Colors.white), // ✅ hanya satu style
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget _buildCountdown() {
    final h = remaining.inHours.toString().padLeft(2, '0');
    final m = (remaining.inMinutes % 60).toString().padLeft(2, '0');
    final s = (remaining.inSeconds % 60).toString().padLeft(2, '0');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _countBox(h, "Jam"),
        _countBox(m, "Menit"),
        _countBox(s, "Detik"),
      ],
    );
  }

  Widget _countBox(String time, String label) => Column(
    children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(time, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      const SizedBox(height: 4),
      Text(label, style: const TextStyle(fontSize: 10)),
    ],
  );

  Widget build(BuildContext context) {
    final bgCream = const Color(0xFFFCEDD6);
    final finalTotal = widget.totalPrice - widget.discount;

    return Scaffold(
      backgroundColor: bgCream,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/images/bg_full.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
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
                      _buildSectionTitle('Alamat Pengiriman'),
                      _buildCard(
                        icon: Icons.home,
                        title: 'Alamat Saya',
                        subtitle: widget.address,
                      ),
                      const SizedBox(height: 16),
                      _buildSectionTitle('Metode Pembayaran'),
                      _buildCard(
                        icon: Icons.payment,
                        title: _getPaymentMethodLabel(),
                        subtitle: widget.paymentDetail,
                        rightText: _getPaymentMethodTag(),
                      ),
                      const SizedBox(height: 16),
                      _buildSectionTitle('Detail Pembayaran'),
                      _buildPriceRow('Total Belanja', widget.totalPrice),
                      _buildPriceRow('Diskon Voucher', -widget.discount),
                      const Divider(),
                      _buildPriceRow('Total Bayar', finalTotal, bold: true),
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

                            final order = Order(
                              date: DateTime.now().toIso8601String(),
                              items: [
                                {
                                  'paymentId': widget.paymentId,
                                  'paymentMethod': widget.paymentMethod,
                                  'paymentDetail': widget.paymentDetail,
                                  'address': widget.address,
                                  'total': widget.totalPrice,
                                  'discount': widget.discount,
                                  'finalTotal':
                                      widget.totalPrice - widget.discount,
                                },
                              ],
                              total: widget.totalPrice - widget.discount,
                              status: 'Dikirim',
                            );

                            await OrderStorage.saveOrder(order);

                            // ✅ Hapus isi cart
                            final cartProvider = context.read<CartProvider>();
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
    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
    String? rightText,
  }) => Container(
    padding: const EdgeInsets.all(12),
    margin: const EdgeInsets.only(top: 6),
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

  Widget _buildPriceRow(String label, int price, {bool bold = false}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Text(
              "Rp$price",
              style: TextStyle(
                fontWeight: bold ? FontWeight.bold : FontWeight.normal,
                color: bold ? Colors.green : null,
              ),
            ),
          ],
        ),
      );

  Widget _buildGuideSection() {
    if (widget.paymentMethod == 'bank') {
      return _buildGuide([
        'Transfer ke No. Rekening: 218097125081234 (a.n. DOBITES SHOP)',
        'Bank: BCA',
        'Lakukan pembayaran sesuai total tagihan.',
        'Simpan bukti transfer dan tunggu konfirmasi.',
      ]);
    } else if (widget.paymentMethod == 'wallet') {
      return _buildGuide([
        'Buka aplikasi E-Wallet kamu.',
        'Masukkan nomor: 218097125081234',
        'Lakukan pembayaran dan simpan bukti transfer.',
      ]);
    } else if (widget.paymentMethod == 'qris') {
      return Image.asset('assets/images/qris_example.png');
    } else {
      return _buildGuide([
        'Siapkan uang tunai dengan nominal yang sesuai.',
        'Berikan kepada kurir saat pesanan diterima.',
      ]);
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
      children: List.generate(
        steps.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            "${index + 1}. ${steps[index]}",
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
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

  Widget _buildHeaderWave(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 160,
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
                      "Pembayaran",
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
