// ==========================
// 📄 payment_method_page.dart (update: Ganti PayPal jadi GoPay, hapus ApplePay)
// ==========================
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String selectedMethod = 'cod';
  String? selectedSubMethod;

  bool expandBank = false;
  bool expandWallet = false;

  void _select(String method, [String? sub]) {
    setState(() {
      selectedMethod = method;
      selectedSubMethod = sub;
    });
  }

  final Map<String, String> bankLogos = {
    'BCA': 'assets/images/bca.png',
    'BNI': 'assets/images/bni.png',
    'BRI': 'assets/images/bri.png',
    'CIMB': 'assets/images/cimb.png',
  };

  final Map<String, String> walletLogos = {
    'GoPay': 'assets/images/gopay.png',
    'Dana': 'assets/images/dana.png',
    'OVO': 'assets/images/ovo.png',
    'Shopee Pay': 'assets/images/shopeepay.png',
  };

  @override
  Widget build(BuildContext context) {
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
              _buildHeaderWave(context),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                  children: [
                    _buildTile(
                      icon: Icons.money,
                      title: 'COD',
                      subtitle: 'Bayar secara cash ke driver saat tiba',
                      selected: selectedMethod == 'cod',
                      onTap: () => _select('cod'),
                    ),
                    _buildTile(
                      icon: Icons.qr_code_2,
                      title: 'QRIS',
                      subtitle: 'Scan Qris dan rasakan kemudahan membayar',
                      selected: selectedMethod == 'qris',
                      onTap: () => _select('qris'),
                    ),
                    _buildExpandableTile(
                      icon: Icons.account_balance,
                      title: 'Bank Transfer',
                      subtitle: 'Transfer berdasarkan bank kamu',
                      expanded: expandBank,
                      onToggle: () => setState(() => expandBank = !expandBank),
                      children: bankLogos.keys.toList(),
                      logoMap: bankLogos,
                      selected: selectedMethod == 'bank',
                      selectedSub: selectedSubMethod,
                      onSelected: (sub) => _select('bank', sub),
                    ),
                    _buildExpandableTile(
                      icon: Icons.account_balance_wallet,
                      title: 'E Wallet',
                      subtitle: 'Bayar secara instan dengan dompet digital',
                      expanded: expandWallet,
                      onToggle: () =>
                          setState(() => expandWallet = !expandWallet),
                      children: walletLogos.keys.toList(),
                      logoMap: walletLogos,
                      selected: selectedMethod == 'wallet',
                      selectedSub: selectedSubMethod,
                      onSelected: (sub) => _select('wallet', sub),
                    ),
                  ],
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
            ),
            onPressed: () {
              Navigator.pop(context, {
                'value': selectedMethod,
                'label': selectedSubMethod ?? selectedMethod.toUpperCase(),
              });
            },
            child: const Text("Pilih Metode Pembayaran"),
          ),
        ),
      ),
    );
  }

  Widget _buildTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? Colors.brown : Colors.transparent,
            width: 1.5,
          ),
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
            Icon(
              selected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: selected ? Colors.brown : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool expanded,
    required VoidCallback onToggle,
    required List<String> children,
    required Map<String, String> logoMap,
    required bool selected,
    required String? selectedSub,
    required Function(String) onSelected,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: selected ? Colors.brown : Colors.transparent,
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onToggle,
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
                      Text(
                        subtitle,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Icon(
                  expanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          if (expanded)
            ...children.map(
              (child) => ListTile(
                leading: Image.asset(
                  logoMap[child]!,
                  width: 28,
                  height: 28,
                  fit: BoxFit.contain,
                ),
                title: Text(child),
                trailing: Radio<String>(
                  value: child,
                  groupValue: selectedSub,
                  onChanged: (val) => onSelected(val!),
                  activeColor: Colors.brown,
                ),
              ),
            ),
        ],
      ),
    );
  }

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
                      "Metode Pembayaran",
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
}
