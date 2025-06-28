import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';

class CartIconWithBadge extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const CartIconWithBadge({
    super.key,
    required this.onPressed,
    this.icon = Icons.shopping_cart_outlined,
  });

  @override
  Widget build(BuildContext context) {
    final totalItems = context.watch<CartProvider>().totalItems;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(40),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(icon, size: 28, color: Colors.black87),
          ),
        ),
        if (totalItems > 0)
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: Colors.red, // 🔴 Warna badge diubah jadi merah
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Text(
                '$totalItems',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
