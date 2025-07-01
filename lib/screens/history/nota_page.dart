import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../models/order_model.dart';
import '../../../services/order_storage.dart';
import 'history.dart';

class NotaPage extends StatefulWidget {
  final Order order;
  const NotaPage({super.key, required this.order});

  @override
  State<NotaPage> createState() => _NotaPageState();
}

class _NotaPageState extends State<NotaPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;

  Order? currentOrder;

  @override
  void initState() {
    super.initState();
    currentOrder = widget.order;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();

    _loadLatestOrderStatus();
  }

  Future<void> _loadLatestOrderStatus() async {
    final allOrders = await OrderStorage.getOrders();
    final latest = allOrders.firstWhere(
      (o) => o.paymentId == widget.order.paymentId,
      orElse: () => widget.order,
    );

    if (mounted) {
      setState(() {
        currentOrder = latest;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadLatestOrderStatus();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'selesai':
        return Colors.green;
      case 'dikirim':
        return Colors.blueAccent;
      case 'diproses':
        return Colors.orange;
      case 'dibatalkan':
        return Colors.grey;
      default:
        return Colors.black87;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentOrder == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final order = currentOrder!;
    final date = DateFormat(
      'dd MMMM yyyy',
      'id_ID',
    ).format(DateTime.parse(order.date));

    return Scaffold(
      backgroundColor: const Color(0xFFFCEDD6),
      body: Stack(
        children: [
          Opacity(
            opacity: 0.15,
            child: Image.asset(
              'assets/images/bg_full.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 24),
                const Image(
                  image: AssetImage('assets/images/logo_text.png'),
                  width: 160,
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    child: Center(
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: ClipPath(
                          clipper: ReceiptClipper(),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Text(
                                    "Success",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown.shade700,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                _buildRow(
                                  "ID Transaksi",
                                  order.paymentId ?? "-",
                                ),
                                _buildRow("Tanggal", date),

                                const SizedBox(height: 16),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.brown,
                                ),
                                const Text(
                                  "Pesanan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.brown,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                ...order.items.map((item) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            item['name'] ?? '-',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Text("x${item['qty']}"),
                                        const SizedBox(width: 8),
                                        Text("Rp${item['price']}"),
                                      ],
                                    ),
                                  );
                                }).toList(),

                                const SizedBox(height: 16),
                                const Divider(
                                  thickness: 1,
                                  color: Colors.brown,
                                ),
                                const Text(
                                  "Rincian Pembayaran",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.brown,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                _buildRow(
                                  "Subtotal",
                                  "Rp${order.total - (order.shippingFee ?? 0) - (order.serviceFee ?? 0) + (order.discount ?? 0)}",
                                ),
                                _buildRow(
                                  "Biaya Layanan",
                                  "Rp${order.serviceFee ?? 0}",
                                ),
                                _buildRow(
                                  "Ongkir",
                                  "Rp${order.shippingFee ?? 0}",
                                ),
                                if ((order.discount ?? 0) > 0)
                                  _buildRow(
                                    "Diskon Voucher",
                                    "-Rp${order.discount}",
                                  ),
                                const Divider(),
                                _buildRow("Total Bayar", "Rp${order.total}"),
                                _buildRow("Total", "Rp${order.total}"),
                                _buildRow(
                                  "Metode Pembayaran",
                                  order.paymentMethod ?? "-",
                                ),
                                _buildRow(
                                  "Status",
                                  order.status ?? "-",
                                  valueColor: _getStatusColor(order.status),
                                ),

                                const SizedBox(height: 24),
                                Center(
                                  child: QrImageView(
                                    data: order.paymentId ?? 'QR',
                                    version: QrVersions.auto,
                                    size: 100,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const HistoryPage(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF4B2C20),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 32,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
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
                      ),
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

  Widget _buildRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: valueColor ?? Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ───────────── CLIPPER KERTAS ───────────── */
class ReceiptClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const waveHeight = 10.0;
    const waveWidth = 20.0;
    final path = Path();

    for (double i = 0; i < size.width; i += waveWidth) {
      path.lineTo(i, 0);
      path.quadraticBezierTo(
        i + waveWidth / 4,
        waveHeight,
        i + waveWidth / 2,
        0,
      );
    }

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    for (double i = size.width; i > 0; i -= waveWidth) {
      path.quadraticBezierTo(
        i - waveWidth / 4,
        size.height - waveHeight,
        i - waveWidth / 2,
        size.height,
      );
    }

    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
