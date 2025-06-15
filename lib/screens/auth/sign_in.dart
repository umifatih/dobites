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

  void _openComingSoon(String provider) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ComingSoon(provider: provider)),
    );
  }

  void _togglePassword() => setState(() => _obscure = !_obscure);

  void _login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Logging in …')));
    }
  }

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
                Row(
                  children: [
                    Checkbox(
                      value: _remember,
                      onChanged: (v) => setState(() => _remember = v ?? false),
                    ),
                    const Text('Remember me'),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPassword(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Color(0xFFFF6B57)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
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
                        color: Colors.white, // ✔ putih
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignUp()),
                      );
                    },
                    child: const Text("Don’t have an account yet? Sign Up"),
                  ),
                ),
                const SizedBox(height: 24),
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Facebook
                    Expanded(
                      child: InkWell(
                        onTap: () => _openComingSoon('Facebook'),
                        borderRadius: BorderRadius.circular(64),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1977F3),
                            borderRadius: BorderRadius.circular(64),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 11,
                                  right: 9,
                                ),
                                width: 24,
                                height: 24,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(64),
                                  child: Image.asset(
                                    'assets/icons/fb.png',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Facebook",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Apple
                    Expanded(
                      child: InkWell(
                        onTap: () => _openComingSoon('Apple'),
                        borderRadius: BorderRadius.circular(64),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          margin: const EdgeInsets.only(right: 11),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(64),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 25,
                                  right: 8,
                                ),
                                width: 24,
                                height: 24,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(64),
                                  child: Image.asset(
                                    'assets/icons/ap.png',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const Text(
                                "Apple",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Google
                    Expanded(
                      child: InkWell(
                        onTap: () => _openComingSoon('Google'),
                        borderRadius: BorderRadius.circular(64),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFCFCFD),
                            borderRadius: BorderRadius.circular(64),
                            border: Border.all(
                              color: const Color(0xFF121926),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 19,
                                  right: 8,
                                ),
                                width: 24,
                                height: 24,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(64),
                                  child: Image.asset(
                                    'assets/icons/go.png',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Google",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xFF121926),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
