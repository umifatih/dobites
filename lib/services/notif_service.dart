import '../models/notification_item.dart';

class NotifService {
  static final List<NotificationItem> _notifications = [];
  static final Set<String> _readIds = {}; // Untuk tracking read/unread

  static void addNotification(NotificationItem item) {
    _notifications.insert(0, item);
  }

  static List<NotificationItem> getNotifications(String tabType) {
    if (tabType == "Semua") return _notifications;
    return _notifications.where((n) => n.type == tabType).toList();
  }

  static void notifyOrderCompleted(String orderId) {
    addNotification(
      NotificationItem(
        title: "Pesanan Berhasil Dibuat",
        message: "Order ID $orderId telah berhasil diproses.",
        type: "Order",
        createdAt: DateTime.now(),
      ),
    );
  }

  static void markAllAsRead() {
    for (var notif in _notifications) {
      _readIds.add(_notifId(notif));
    }
  }

  static void markAsRead(NotificationItem notif) {
    _readIds.add(_notifId(notif));
  }

  static bool isRead(NotificationItem notif) {
    return _readIds.contains(_notifId(notif));
  }

  static void removeNotification(NotificationItem notif) {
    _notifications.remove(notif);
    _readIds.remove(_notifId(notif));
  }

  static int unreadCount() {
    return _notifications.where((n) => !_readIds.contains(_notifId(n))).length;
  }

  static String _notifId(NotificationItem notif) {
    return '${notif.title}_${notif.createdAt.toIso8601String()}';
  }
}
