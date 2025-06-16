import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'coming_soon.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  bool _obscurePwd = true;
  bool _obscureConfirm = true;
  bool _agree = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  /* ───────────── Helpers ───────────── */

  void _openComingSoon(String provider) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ComingSoon(provider: provider)),
    );
  }

  void _togglePwd() => setState(() => _obscurePwd = !_obscurePwd);
  void _toggleConfirm() => setState(() => _obscureConfirm = !_obscureConfirm);

  Future<void> _signUp() async {
    if (!_agree) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please accept Terms & Conditions')),
      );
      return;
    }
    if (!_formKey.currentState!.validate()) return;

    // loading dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text.trim(),
      );

      if (!mounted) return;
      Navigator.pop(context); // close dialog
      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;
      Navigator.pop(context);

      String msg = 'Sign-up failed.';
      switch (e.code) {
        case 'email-already-in-use':
          msg = 'Email already registered.';
          break;
        case 'weak-password':
          msg = 'Password too weak (min 6 chars).';
          break;
        case 'invalid-email':
          msg = 'Invalid email format.';
          break;
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
        leading: BackButton(color: brown),
      ),
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
                  'Let’s Join Shopping!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF6B57),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Join thousands of happy shoppers. It’s fast, free, and only takes a few seconds!",
                  style: TextStyle(fontSize: 16, color: Color(0xFF121926)),
                ),
                const SizedBox(height: 40),

                /* Email */
                TextFormField(
                  controller: _emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _inputDecoration(
                    'Email',
                    hint: 'your@email.com',
                    prefixIcon: 'assets/icons/email.png',
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Email required';
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(v)) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                /* Full Name */
                TextFormField(
                  controller: _nameCtrl,
                  textCapitalization: TextCapitalization.words,
                  decoration: _inputDecoration(
                    'Full Name',
                    hint: 'Your name',
                    prefixIcon: 'assets/icons/user.png',
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Name required' : null,
                ),
                const SizedBox(height: 24),

                /* Phone */
                TextFormField(
                  controller: _phoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: _inputDecoration(
                    'Phone Number',
                    hint: '+62 …',
                    prefixIcon: 'assets/icons/phone.png',
                  ),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Phone required' : null,
                ),
                const SizedBox(height: 24),

                /* Password */
                TextFormField(
                  controller: _passwordCtrl,
                  obscureText: _obscurePwd,
                  decoration: _inputDecoration(
                    'Password',
                    hint: 'Enter password',
                    prefixIcon: 'assets/icons/lock.png',
                    suffix: IconButton(
                      icon: Icon(
                        _obscurePwd ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: _togglePwd,
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Password required';
                    if (v.length < 6) return 'Minimum 6 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                /* Confirm Password */
                TextFormField(
                  controller: _confirmCtrl,
                  obscureText: _obscureConfirm,
                  decoration: _inputDecoration(
                    'Confirm Password',
                    hint: 'Re-enter password',
                    prefixIcon: 'assets/icons/lock.png',
                    suffix: IconButton(
                      icon: Icon(
                        _obscureConfirm
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: _toggleConfirm,
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return 'Please confirm password';
                    }
                    if (v != _passwordCtrl.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                /* Terms */
                Row(
                  children: [
                    Checkbox(
                      value: _agree,
                      onChanged: (v) => setState(() => _agree = v ?? false),
                    ),
                    Expanded(
                      child: Text(
                        'I agree with all Terms & Conditions & Privacy Policy',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                /* Sign Up Button */
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _agree ? brown : const Color(0xFFEEF2F6),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    onPressed: _agree ? _signUp : null,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _agree ? Colors.white : const Color(0xFFCDD5DF),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Already have an account? Login'),
                  ),
                ),
                const SizedBox(height: 24),

                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('You can try another method'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                const SizedBox(height: 24),

                /* Social Buttons */
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _socialButton(
                        color: const Color(0xFF1977F3),
                        label: 'Facebook',
                        iconPath: 'assets/icons/fb.png',
                        onTap: () => _openComingSoon('Facebook'),
                        labelColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _socialButton(
                        color: Colors.black,
                        label: 'Apple',
                        iconPath: 'assets/icons/ap.png',
                        onTap: () => _openComingSoon('Apple'),
                        labelColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _socialButton(
                        color: const Color(0xFFFCFCFD),
                        borderColor: const Color(0xFFEEF2F6),
                        label: 'Google',
                        iconPath: 'assets/icons/go.png',
                        onTap: () => _openComingSoon('Google'),
                        labelColor: const Color(0xFF121926),
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

  /* ───────────── Widgets ───────────── */

  Widget _socialButton({
    required Color color,
    Color? borderColor,
    required String label,
    required String iconPath,
    required VoidCallback onTap,
    required Color labelColor,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(64),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(64),
          border: borderColor != null
              ? Border.all(color: borderColor, width: 1)
              : null,
        ),
        child: Row(
          children: [
            const SizedBox(width: 13),
            Image.asset(iconPath, width: 24, height: 24),
            const SizedBox(width: 9),
            Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: labelColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(
    String label, {
    String? hint,
    String? prefixIcon,
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
      prefixIcon: prefixIcon != null
          ? Padding(
              padding: const EdgeInsets.all(12),
              child: Image.asset(prefixIcon, width: 20, height: 20),
            )
          : null,
      suffixIcon: suffix,
    );
  }
}
