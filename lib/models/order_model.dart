class Order {
  String date;
  List<Map<String, dynamic>> items;
  int total;
  String status;

  // Tambahan
  String? paymentId;
  String? paymentMethod;
  int? discount;

  int? shippingFee;
  int? serviceFee;

  Order({
    required this.date,
    required this.items,
    required this.total,
    required this.status,
    this.paymentId,
    this.paymentMethod,
    this.discount,
    this.shippingFee,
    this.serviceFee,
  });

  Map<String, dynamic> toJson() => {
    'date': date,
    'items': items,
    'total': total,
    'status': status,
    'paymentId': paymentId,
    'paymentMethod': paymentMethod,
    'discount': discount,
    'shippingFee': shippingFee, // ✅ Tambahkan ini
    'serviceFee': serviceFee, // ✅ Tambahkan ini
  };

  static Order fromJson(Map<String, dynamic> json) => Order(
    date: json['date'],
    items: List<Map<String, dynamic>>.from(json['items']),
    total: json['total'],
    status: json['status'],
    paymentId: json['paymentId'],
    paymentMethod: json['paymentMethod'],
    discount: json['discount'],
    shippingFee: json['shippingFee'] ?? 0, // ✅ Pastikan fallback 0
    serviceFee: json['serviceFee'] ?? 0, // ✅ Pastikan fallback 0
  );
}
