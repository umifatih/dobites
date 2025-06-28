import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/address.dart';

class AddressService {
  static const String key = 'user_addresses';

  // Simpan seluruh alamat
  static Future<void> saveAddresses(List<Address> addresses) async {
    final prefs = await SharedPreferences.getInstance();
    final json = jsonEncode(addresses.map((e) => e.toJson()).toList());
    await prefs.setString(key, json);
  }

  // Tambah alamat baru
  static Future<void> addAddress(Address newAddress) async {
    final addresses = await getAddresses();

    if (newAddress.isPrimary) {
      for (var a in addresses) {
        a.isPrimary = false;
      }
    }

    addresses.add(newAddress);
    await saveAddresses(addresses);

    // Tambahkan log debug untuk verifikasi
    print("📦 Alamat berhasil disimpan ke SharedPreferences:");
    for (var a in addresses) {
      print("- ${a.label} | ${a.detail} | ${a.isPrimary}");
    }
  }

  // Update alamat berdasarkan index
  static Future<void> updateAddress(int index, Address updated) async {
    final addresses = await getAddresses();

    if (updated.isPrimary) {
      for (var a in addresses) {
        a.isPrimary = false;
      }
    }

    if (index >= 0 && index < addresses.length) {
      addresses[index] = updated;
      await saveAddresses(addresses);
    }
  }

  // Hapus alamat berdasarkan index
  static Future<void> deleteAddress(int index) async {
    final addresses = await getAddresses();
    if (index >= 0 && index < addresses.length) {
      addresses.removeAt(index);
      await saveAddresses(addresses);
    }
  }

  // Ambil seluruh alamat
  static Future<List<Address>> getAddresses() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);

    if (data == null) {
      print("📭 Belum ada data alamat disimpan.");
      return [];
    }

    print("📥 Data dari SharedPreferences: $data");

    final list = jsonDecode(data) as List;
    return list.map((e) => Address.fromJson(e)).toList();
  }
}
