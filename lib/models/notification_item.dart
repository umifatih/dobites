class NotificationItem {
  final String title;
  final String message;
  final String type; // Order, Promo, Sistem
  final DateTime createdAt;

  NotificationItem({
    required this.title,
    required this.message,
    required this.type,
    required this.createdAt,
  });
}
