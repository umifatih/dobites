class Product {
  final String id;
  final String name;
  final String imageUrl;
  final int price;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  factory Product.fromMap(String id, Map<String, dynamic> map) => Product(
    id: id,
    name: map['name'] ?? '',
    imageUrl: map['image'] ?? '',
    price: (map['price'] ?? 0) as int,
    description: map['description'] ?? '',
  );

  Map<String, dynamic> toMap() => {
    'name': name,
    'image': imageUrl,
    'price': price,
    'description': description,
  };
}
