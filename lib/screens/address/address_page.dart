// ==========================
// 📄 address_page.dart (Final with Select + Phone)
// ==========================
import 'package:flutter/material.dart';
import 'package:dobites/models/address.dart';
import 'package:dobites/services/address_service.dart';
import 'add_address_page.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final Color bgCream = const Color(0xFFFCEDD6);
  List<Address> addresses = [];

  @override
  void initState() {
    super.initState();
    _loadAddresses();
  }

  Future<void> _loadAddresses() async {
    final data = await AddressService.getAddresses();
    setState(() => addresses = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgCream,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'assets/images/bg_full.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              _buildHeaderWave(context, "Alamat Pengiriman"),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFFF725E)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AddAddressPage(),
                        ),
                      );
                      if (result == true) await _loadAddresses();
                    },
                    child: const Text(
                      "Tambah Alamat Baru  +",
                      style: TextStyle(
                        color: Color(0xFFFF725E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: addresses.isEmpty
                      ? _buildEmptyAddress()
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: addresses.length,
                          itemBuilder: (context, index) {
                            final a = addresses[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: a.isPrimary
                                      ? Colors.orange
                                      : Colors.transparent,
                                ),
                              ),
                              child: ListTile(
                                leading: const Icon(Icons.location_on_outlined),
                                title: Text(
                                  a.label,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(a.detail),
                                    const SizedBox(height: 4),
                                    Text("No. HP: ${a.phone}"),
                                  ],
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit_outlined),
                                      onPressed: () async {
                                        final result = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => AddAddressPage(
                                              isEdit: true,
                                              existingAddress: a,
                                              index: index,
                                            ),
                                          ),
                                        );
                                        if (result == true)
                                          await _loadAddresses();
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete_outline),
                                      onPressed: () async {
                                        final confirm = await showDialog<bool>(
                                          context: context,
                                          builder: (_) => AlertDialog(
                                            title: const Text("Hapus Alamat"),
                                            content: const Text(
                                              "Yakin ingin menghapus alamat ini?",
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                  context,
                                                  false,
                                                ),
                                                child: const Text("Batal"),
                                              ),
                                              ElevatedButton(
                                                onPressed: () => Navigator.pop(
                                                  context,
                                                  true,
                                                ),
                                                child: const Text("Hapus"),
                                              ),
                                            ],
                                          ),
                                        );
                                        if (confirm == true) {
                                          await AddressService.deleteAddress(
                                            index,
                                          );
                                          await _loadAddresses();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                                onTap: () => Navigator.pop(context, {
                                  'label': a.label,
                                  'detail': a.detail,
                                  'phone': a.phone,
                                }),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyAddress() {
    return Column(
      children: [
        Image.asset('assets/images/empty_address.png', width: 260, height: 260),
        const SizedBox(height: 16),
        const Text(
          'Belum ada alamat',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Text(
            'Tambahkan alamat pengiriman kamu terlebih dahulu untuk mempermudah checkout pesanan.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderWave(BuildContext context, String title) {
    return Stack(
      children: [
        Container(
          height: 140,
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
            padding: const EdgeInsets.only(top: 0, left: 16, right: 16),
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
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
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
