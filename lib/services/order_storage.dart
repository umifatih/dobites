import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/order_model.dart';

class OrderStorage {
  static const _key = 'order_history';

  static Future<void> saveOrder(Order order) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = prefs.getStringList(_key) ?? [];

    history.add(jsonEncode(order.toJson())); // ✅ ini menambah, bukan menimpa
    await prefs.setStringList(_key, history);
  }

  static Future<List<Order>> getOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = prefs.getStringList(_key) ?? [];
    return history.map((e) => Order.fromJson(jsonDecode(e))).toList();
  }

  static Future<void> updateOrder(Order updatedOrder) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> history = prefs.getStringList(_key) ?? [];

    final updatedHistory = history.map((e) {
      final order = Order.fromJson(jsonDecode(e));
      if (order.date == updatedOrder.date &&
          order.total == updatedOrder.total) {
        return jsonEncode(updatedOrder.toJson());
      }
      return e;
    }).toList();

    await prefs.setStringList(_key, updatedHistory);
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
