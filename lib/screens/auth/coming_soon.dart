import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final String provider;

  const ComingSoon({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Header menyesuaikan provider
        title: Text('Login by $provider'),
        backgroundColor: const Color(0xFF7B5347),
      ),
      body: Center(
        child: Text(
          '$provider Login – Coming Soon',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
