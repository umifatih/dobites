import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dobites/providers/cart_provider.dart';
import 'package:dobites/screens/address/address_page.dart';
import 'package:dobites/screens/payment/payment_method_page.dart';
import 'package:dobites/screens/voucher/voucher_page.dart';
import 'package:dobites/screens/payment/payment_page.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String selectedShipping = 'instan';
  Map<String, String>? selectedPayment;
  Map<String, String>? selectedVoucher;

  String? selectedAddressLabel;
  String? selectedAddressDetail;
  String? selectedAddressPhone;
  bool useCoin = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    final items = cartProvider.items.values.toList();
    final bgCream = const Color(0xFFFCEDD6);

    return Scaffold(
      backgroundColor: bgCream,
      body: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Image.asset(
              'assets/images/bg_full.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            children: [
              _buildHeaderWave(context, "Konfirmasi Pesanan"),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Detail Transaksi",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      for (var item in items) _buildCartItem(item),

                      const SizedBox(height: 24),
                      const Text(
                        "Metode Pengiriman",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildShippingTile(
                        "instan",
                        "Pengiriman Instan",
                        "Estimasi 10 - 20 menit",
                        15000,
                        Icons.flash_on,
                      ),
                      _buildShippingTile(
                        "reguler",
                        "Pengiriman Reguler",
                        "Estimasi 30 - 40 menit",
                        9000,
                        Icons.local_shipping,
                      ),
                      _buildShippingTile(
                        "hemat",
                        "Pengiriman Hemat",
                        "Estimasi 50 - 60 menit",
                        6000,
                        Icons.access_time,
                      ),

                      const SizedBox(height: 24),
                      const Text(
                        "Alamat Pengiriman",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildAddressTile(
                        label: selectedAddressLabel,
                        detail: selectedAddressDetail,
                        phone: selectedAddressPhone,
                        onTap: () async {
                          final result =
                              await Navigator.push<Map<String, String>>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const AddressPage(),
                                ),
                              );
                          if (result != null) {
                            setState(() {
                              selectedAddressLabel = result['label'];
                              selectedAddressDetail = result['detail'];
                              selectedAddressPhone = result['phone'];
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 24),
                      const Text(
                        "Metode Pembayaran",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildInputTile(
                        selectedPayment?['label'] ?? "Pilih metode pembayaran",
                        onTap: () async {
                          final result =
                              await Navigator.push<Map<String, String>>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PaymentMethodPage(),
                                ),
                              );
                          if (result != null) {
                            setState(() {
                              selectedPayment = result;
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 24),
                      const Text(
                        "Voucher",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildInputTile(
                        selectedVoucher?['title'] ?? "Pilih voucher",
                        suffix: "Gunakan",
                        onTap: () async {
                          final result =
                              await Navigator.push<Map<String, String>>(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const VoucherPage(),
                                ),
                              );
                          if (result != null) {
                            setState(() {
                              selectedVoucher = result;
                            });
                          }
                        },
                      ),

                      const SizedBox(height: 16),
                      _buildToggle("Gunakan koin"),

                      const SizedBox(height: 24),
                      const Text(
                        "Rincian Pesanan",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _buildPriceRow(
                        "Subtotal",
                        _calculateSubtotal(cartProvider),
                      ),
                      _buildPriceRow("Biaya layanan", 5000),
                      _buildPriceRow("Ongkir", _getOngkir()),
                      if (useCoin) _buildPriceRow("Bonus Poin", -90),
                      if (selectedVoucher != null)
                        _buildPriceRow(
                          "Voucher (${selectedVoucher!['title']})",
                          -_getVoucherDiscount(cartProvider),
                        ),
                      const Divider(),
                      _buildPriceRow(
                        "Total",
                        _calculateSubtotal(cartProvider) +
                            5000 +
                            _getOngkir() -
                            (useCoin ? 90 : 0) -
                            _getVoucherDiscount(cartProvider),
                        isTotal: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4B2C20),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PaymentPage(
                    paymentMethod: selectedPayment?['value'] ?? 'cod',
                    paymentDetail:
                        selectedPayment?['label'] ?? 'Bayar di Tempat',
                    totalPrice:
                        _calculateSubtotal(cartProvider) + 5000 + _getOngkir(),
                    discount: _getVoucherDiscount(cartProvider),
                    paymentId: 'PAY${DateTime.now().millisecondsSinceEpoch}',
                    address:
                        '${selectedAddressDetail ?? ''} - ${selectedAddressLabel ?? ''}',
                  ),
                ),
              );
            },

            child: const Text("Checkout"),
          ),
        ),
      ),
    );
  }

  int _getVoucherDiscount(CartProvider provider) {
    if (selectedVoucher == null) return 0;
    final type = selectedVoucher!['type'];
    final value = int.tryParse(selectedVoucher!['discount'] ?? '0') ?? 0;

    if (type == 'fixed') return value;
    if (type == 'percent')
      return (_calculateSubtotal(provider) * value / 100).toInt();
    if (type == 'freeship') return _getOngkir();
    return 0;
  }

  Widget _buildAddressTile({
    String? label,
    String? detail,
    String? phone,
    VoidCallback? onTap,
  }) {
    final isEmpty = label == null || detail == null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isEmpty ? Colors.grey.shade300 : Colors.brown,
            width: 1.2,
          ),
        ),
        child: isEmpty
            ? const Text("Pilih alamat", style: TextStyle(color: Colors.grey))
            : Row(
                children: [
                  const Icon(Icons.home, color: Color(0xFF4B2C20)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          detail!,
                          style: const TextStyle(color: Colors.black54),
                        ),
                        if (phone != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              phone,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildShippingTile(
    String value,
    String title,
    String subtitle,
    int price,
    IconData icon,
  ) {
    final isSelected = selectedShipping == value;
    return GestureDetector(
      onTap: () => setState(() => selectedShipping = value),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isSelected ? Colors.brown : Colors.transparent,
            width: 1.5,
          ),
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
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(subtitle, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            Text(
              "Rp$price",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.green : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(cartItem) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              cartItem.product.imageUrl,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('x${cartItem.quantity}  •  Rp${cartItem.product.price}'),
              ],
            ),
          ),
          Text('Rp${cartItem.product.price * cartItem.quantity}'),
        ],
      ),
    );
  }

  Widget _buildInputTile(String text, {String? suffix, VoidCallback? onTap}) {
    final isPlaceholder =
        text == 'Pilih alamat' ||
        text == 'Masukkan kode voucher' ||
        text == 'Pilih metode pembayaran';
    final icon = text.toLowerCase().contains('voucher')
        ? Icons.card_giftcard
        : Icons.payments_outlined;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF4B2C20)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: isPlaceholder ? Colors.grey : Colors.black87,
                  fontWeight: isPlaceholder
                      ? FontWeight.normal
                      : FontWeight.w600,
                ),
              ),
            ),
            if (suffix != null)
              Text(
                suffix,
                style: const TextStyle(
                  color: Color(0xFF4B2C20),
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggle(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        Switch(
          value: useCoin,
          onChanged: (val) => setState(() => useCoin = val),
          activeColor: const Color(0xFF4B2C20),
        ),
      ],
    );
  }

  Widget _buildPriceRow(String label, int price, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 16 : 14,
            ),
          ),
          Text(
            "Rp$price",
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: isTotal ? 16 : 14,
              color: isTotal ? Colors.green : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderWave(BuildContext context, String title) {
    final cartCount = context.watch<CartProvider>().totalItems;
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
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const Icon(
                          Icons.shopping_cart_outlined,
                          size: 22,
                          color: Colors.white,
                        ),
                        if (cartCount > 0)
                          Positioned(
                            right: -6,
                            top: -6,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 16,
                                minHeight: 16,
                              ),
                              child: Text(
                                '$cartCount',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
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

  int _calculateSubtotal(CartProvider provider) {
    return provider.items.values.fold(
      0,
      (total, item) => total + item.product.price * item.quantity,
    );
  }

  int _getOngkir() {
    switch (selectedShipping) {
      case 'instan':
        return 15000;
      case 'reguler':
        return 9000;
      case 'hemat':
        return 6000;
      default:
        return 0;
    }
  }
}
