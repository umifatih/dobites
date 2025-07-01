import 'package:flutter/material.dart';
import '../../models/notification_item.dart';
import '../../services/notif_service.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({super.key});

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFFCEDD6),
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              _buildTabBar(),
              Expanded(child: _buildTabBarView()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.black87, size: 20),
                SizedBox(width: 6),
                Text("Kembali", style: TextStyle(color: Colors.black87)),
              ],
            ),
          ),
          const Spacer(),
          const Text(
            "Notifikasi",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Spacer(flex: 2),
          const Icon(Icons.notifications, color: Colors.black87),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: const Color(0xFFFBE8DB),
      child: const TabBar(
        indicatorColor: Color(0xFFFF6B57),
        labelColor: Color(0xFFFF6B57),
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        tabs: [
          Tab(text: "Semua"),
          Tab(text: "Order"),
          Tab(text: "Promo"),
          Tab(text: "Sistem"),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    final tabs = ["Semua", "Order", "Promo", "Sistem"];
    return TabBarView(
      children: tabs.map((type) => _buildNotifList(type)).toList(),
    );
  }

  Widget _buildNotifList(String type) {
    final items = NotifService.getNotifications(type);
    if (items.isEmpty) return _buildEmptyNotifWidget();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "What's New?",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    NotifService.markAllAsRead();
                  });
                },
                child: const Text(
                  "Mark all as read",
                  style: TextStyle(color: Colors.redAccent, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final notif = items[index];
              return Dismissible(
                key: Key('${notif.title}_${notif.createdAt}'),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 20),
                  color: Colors.redAccent,
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) {
                  setState(() {
                    NotifService.removeNotification(notif);
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      NotifService.markAsRead(notif);
                    });
                  },
                  child: _buildCustomNotifTile(notif),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCustomNotifTile(NotificationItem notif) {
    IconData icon;
    Color iconBg;

    switch (notif.type) {
      case 'Order':
        icon = Icons.check_circle;
        iconBg = Colors.red.shade100;
        break;
      case 'Promo':
        icon = Icons.local_offer;
        iconBg = Colors.green.shade100;
        break;
      case 'Sistem':
      default:
        icon = Icons.info_outline;
        iconBg = Colors.blue.shade100;
    }

    final isRead = NotifService.isRead(notif);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isRead ? Colors.white : const Color(0xFFFDF3EE), // ⬅ beda warna
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconBg,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.black54, size: 20),
              ),
              if (!isRead)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notif.title,
                  style: TextStyle(
                    fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  notif.message,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                    fontWeight: isRead ? FontWeight.normal : FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            "${notif.createdAt.hour}:${notif.createdAt.minute.toString().padLeft(2, '0')}",
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyNotifWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/notifikasi.png', width: 220),
            const SizedBox(height: 20),
            const Text(
              "Belum ada notifikasi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Kami akan memberitahumu jika ada update penting.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
