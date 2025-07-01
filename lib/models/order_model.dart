class Order {
  final String date;
  final List<Map<String, dynamic>> items;
  final int total;
  String status;

  Order({
    required this.date,
    required this.items,
    required this.total,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
    'date': date,
    'items': items,
    'total': total,
    'status': status,
  };

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    date: json['date'],
    items: List<Map<String, dynamic>>.from(json['items']),
    total: json['total'],
    status: json['status'],
  );
}
