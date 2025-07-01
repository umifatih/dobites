import 'package:flutter/material.dart';
import '../../services/notif_service.dart';

class NotifIconWithBadge extends StatelessWidget {
  final VoidCallback onTap;

  const NotifIconWithBadge({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    int count = NotifService.unreadCount();

    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.black87),
          onPressed: onTap,
        ),
        if (count > 0)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
