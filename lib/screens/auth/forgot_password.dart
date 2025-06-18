import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// Forgot Password screen (consistent with SignIn / SignUp)
///
/// Navigate with:
/// Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPassword()));
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();

  @override
  void dispose() {
    _emailCtrl.dispose();
    super.dispose();
  }

  /* ───────────── Helpers ───────────── */

  Future<void> _sendResetLink() async {
    if (!_formKey.currentState!.validate()) return;

    // show loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailCtrl.text.trim(),
      );

      if (!mounted) return;
      Navigator.pop(context); // close dialog
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Link sudah terkirim ke email kamu!')),
      );
      Navigator.pop(context); // back to sign-in page
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      Navigator.pop(context);

      String msg = 'Failed to send reset link.';
      if (e.code == 'user-not-found') {
        msg = 'Email is not registered.';
      } else if (e.code == 'invalid-email') {
        msg = 'Invalid email format.';
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (_) {
      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Unexpected error, try again.')),
        );
      }
    }
  }

  /* ───────────── UI ───────────── */

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF7B5347);
    const peach = Color(0xFFFCEDD6);

    return Scaffold(
      backgroundColor: peach,
      appBar: AppBar(
        backgroundColor: peach,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF121926)),
        title: const Text(
          'Lupa Password',
          style: TextStyle(color: Color(0xFF121926)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Jangan Khawatir!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF121926),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Masukkan email yang terdaftar untuk mengatur ulang password kamu.',
                style: TextStyle(fontSize: 16, color: Color(0xFF364152)),
              ),
              const SizedBox(height: 40),

              /* Email */
              TextFormField(
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration('Email', hint: 'your@email.com'),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Email required';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v.trim())) {
                    return 'Invalid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              /* Send Button */
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: brown,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  onPressed: _sendResetLink,
                  child: const Text(
                    'Kirim Link Reset',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /* ───────────── Decorations ───────────── */

  InputDecoration _inputDecoration(
    String label, {
    String? hint,
    Widget? suffix,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: Color(0xFF121926)),
      ),
      suffixIcon: suffix,
    );
  }
}
