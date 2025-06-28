class Address {
  String label; // Nama penerima / label alamat
  String phone;
  String category;
  String detail;
  bool isPrimary;

  Address({
    required this.label,
    required this.phone,
    required this.category,
    required this.detail,
    required this.isPrimary,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    label: json['label'],
    phone: json['phone'],
    category: json['category'],
    detail: json['detail'],
    isPrimary: json['isPrimary'] ?? false,
  );

  Map<String, dynamic> toJson() => {
    'label': label,
    'phone': phone,
    'category': category,
    'detail': detail,
    'isPrimary': isPrimary,
  };
}
