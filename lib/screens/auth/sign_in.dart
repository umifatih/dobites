import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'forgot_password.dart';
import 'coming_soon.dart';
import 'sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _obscure = true;
  bool _remember = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  /* ───────────────────────────── Helpers ─────────────────────────── */

  void _openComingSoon(String provider) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ComingSoon(provider: provider)),
    );
  }

  void _togglePassword() => setState(() => _obscure = !_obscure);

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    // tampilkan loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text.trim(),
      );

      if (!mounted) return; // ⬅️ Pastikan context masih valid
      Navigator.pop(context); // tutup dialog
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      Navigator.pop(context); // tutup dialog
      String msg = 'Login gagal, periksa kembali data Anda.';
      if (e.code == 'user-not-found') {
        msg = 'Email belum terdaftar.';
      } else if (e.code == 'wrong-password') {
        msg = 'Password salah.';
      } else if (e.code == 'invalid-email') {
        msg = 'Format email tidak valid.';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Unexpected error: ${e.toString()}')),
      );
    }
  }

  /* ───────────────────────────── UI ─────────────────────────────── */

  @override
  Widget build(BuildContext context) {
    const brown = Color(0xFF7B5347);
    const peach = Color(0xFFFCEDD6);

    return Scaffold(
      backgroundColor: peach,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/images/logo_text.png', width: 160),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF121926),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Sign in to track your orders, manage your wishlist, and shop your favourite items anytime.',
                  style: TextStyle(fontSize: 16, color: Color(0xFF364152)),
                ),
                const SizedBox(height: 40),

                /* ---------------- Email ---------------- */
                TextFormField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration('Email', hint: 'your@email.com'),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Email required';
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                /* ---------------- Password -------------- */
                TextFormField(
                  controller: _passwordCtrl,
                  obscureText: _obscure,
                  decoration: _inputDecoration(
                    'Password',
                    hint: 'Enter your password',
                    suffix: IconButton(
                      icon: Icon(
                        _obscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _togglePassword,
                    ),
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Password required' : null,
                ),
                const SizedBox(height: 12),

                /* ---------------- Remember + Forgot ---- */
                Row(
                  children: [
                    Checkbox(
                      value: _remember,
                      onChanged: (v) => setState(() => _remember = v ?? false),
                    ),
                    const Text('Remember me'),
                    const Spacer(),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ForgotPassword(),
                        ),
                      ),
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Color(0xFFFF6B57)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                /* ---------------- Login Button ---------- */
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
                    onPressed: _login,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                /* ---------------- Sign Up link ---------- */
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SignUp()),
                    ),
                    child: const Text("Don’t have an account yet? Sign Up"),
                  ),
                ),
                const SizedBox(height: 24),

                /* ---------------- Divider --------------- */
                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('or continue with'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 24),

                /* ---------------- Social Buttons -------- */
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _socialButton(
                      color: const Color(0xFF1977F3),
                      iconAsset: 'assets/icons/fb.png',
                      label: 'Facebook',
                      onTap: () => _openComingSoon('Facebook'),
                    ),
                    const SizedBox(width: 10),
                    _socialButton(
                      color: Colors.black,
                      iconAsset: 'assets/icons/ap.png',
                      label: 'Apple',
                      onTap: () => _openComingSoon('Apple'),
                    ),
                    const SizedBox(width: 10),
                    _socialButton(
                      color: const Color(0xFFFCFCFD),
                      iconAsset: 'assets/icons/go.png',
                      label: 'Google',
                      textColor: const Color(0xFF121926),
                      border: Border.all(color: Color(0xFF121926)),
                      onTap: () => _openComingSoon('Google'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /* ───────────────── Widgets & Decorations ───────────────────────── */

  Widget _socialButton({
    required Color color,
    required String iconAsset,
    required String label,
    required VoidCallback onTap,
    Color textColor = Colors.white,
    Border? border,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(64),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(64),
            border: border,
          ),
          child: Row(
            children: [
              const SizedBox(width: 12),
              Image.asset(iconAsset, width: 24, height: 24),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
