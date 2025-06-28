// ==========================
// 📄 add_address_page.dart
// ==========================
import 'package:flutter/material.dart';
import 'package:dobites/models/address.dart';
import 'package:dobites/services/address_service.dart';

class AddAddressPage extends StatefulWidget {
  final bool isEdit;
  final Address? existingAddress;
  final int? index;

  const AddAddressPage({
    super.key,
    this.isEdit = false,
    this.existingAddress,
    this.index,
  });

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  String selectedCategory = "Rumah";
  bool isPrimary = false;

  final List<String> categories = ["Rumah", "Kantor", "Lainnya"];

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.existingAddress != null) {
      _nameController.text = widget.existingAddress!.label;
      _phoneController.text = widget.existingAddress!.phone;
      _addressController.text = widget.existingAddress!.detail;
      selectedCategory = widget.existingAddress!.category;
      isPrimary = widget.existingAddress!.isPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    const bgCream = Color(0xFFFCEDD6);

    return Scaffold(
      backgroundColor: bgCream,
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
              _buildHeaderWave(
                context,
                widget.isEdit ? "Edit Alamat" : "Tambah Alamat",
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Nama Penerima"),
                      const SizedBox(height: 8),
                      _buildInput(_nameController),
                      const SizedBox(height: 16),
                      const Text("Nomor HP"),
                      const SizedBox(height: 8),
                      _buildInput(
                        _phoneController,
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: 16),
                      const Text("Kategori"),
                      const SizedBox(height: 8),
                      DropdownButtonFormField<String>(
                        value: selectedCategory,
                        items: categories
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                        onChanged: (value) =>
                            setState(() => selectedCategory = value!),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text("Alamat Lengkap"),
                      const SizedBox(height: 8),
                      _buildInput(_addressController, maxLines: 2),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Jadikan alamat utama"),
                          Switch(
                            value: isPrimary,
                            onChanged: (val) => setState(() => isPrimary = val),
                            activeColor: const Color(0xFF4B2C20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4B2C20),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () async {
                            final newAddress = Address(
                              label: _nameController.text,
                              phone: _phoneController.text,
                              category: selectedCategory,
                              detail: _addressController.text,
                              isPrimary: isPrimary,
                            );

                            if (widget.isEdit && widget.index != null) {
                              await AddressService.updateAddress(
                                widget.index!,
                                newAddress,
                              );
                            } else {
                              await AddressService.addAddress(newAddress);
                            }

                            if (context.mounted) Navigator.pop(context, true);
                          },
                          child: const Text(
                            "Simpan",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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

  Widget _buildInput(
    TextEditingController controller, {
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
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
                      size: 22,
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
