/// Model dasar untuk satu produk.
class Product {
  final String id; // slug unik, mis. "cookie-red-velvet"
  final String name; // nama yang ditampilkan
  final String imageUrl; // bisa asset ('assets/images/…') atau URL http
  final int price; // dalam rupiah (tanpa separator titik/koma)

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  /* ---------------- Serialization ---------------- */

  /// Buat objek [Product] dari Map (mis. dokumen Firestore).
  factory Product.fromMap(String id, Map<String, dynamic> map) => Product(
    id: id,
    name: map['name'] ?? '',
    imageUrl: map['image'] ?? '',
    price: (map['price'] ?? 0) as int,
  );

  /// Ubah [Product] ke Map (untuk disimpan ke Firestore).
  Map<String, dynamic> toMap() => {
    'name': name,
    'image': imageUrl,
    'price': price,
  };
}
