class Voucher {
  final String title;
  final String desc;
  final String expiry; // Format: yyyy-MM-dd
  final String code;
  final int discount;
  final String type; // 'fixed', 'percent', or 'freeship'

  Voucher({
    required this.title,
    required this.desc,
    required this.expiry,
    required this.code,
    required this.discount,
    required this.type,
  });

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
    title: json['title'],
    desc: json['desc'],
    expiry: json['expiry'],
    code: json['code'],
    discount: json['discount'],
    type: json['type'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'desc': desc,
    'expiry': expiry,
    'code': code,
    'discount': discount,
    'type': type,
  };
}
