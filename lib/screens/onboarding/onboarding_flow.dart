import 'package:flutter/material.dart';
import '../auth/sign_in.dart';

class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key});

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final _controller = PageController();

  final _indicators = [
    'assets/images/indikator_page1.png',
    'assets/images/indikator_page2.png',
    'assets/images/indikator_page3.png',
  ];

  void _next() {
    final page = _controller.page ?? 0;
    if (page < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      );
    } else {
      _goToLogin();
    }
  }

  void _skip() => _goToLogin();

  /// Ganti route stack sepenuhnya ke SignIn agar tombol back tidak kembali ke onboarding.
  void _goToLogin() => Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (_) => const SignIn()),
    (route) => false,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF593412),
      body: SafeArea(
        child: Column(
          children: [
            // ──────────────── Gambar indikator ────────────────
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                final page = _controller.hasClients && _controller.page != null
                    ? _controller.page!.round()
                    : 0;
                return Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Center(
                    child: Image.asset(
                      _indicators[page.clamp(0, _indicators.length - 1)],
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            // ───────────────────── PAGEVIEW ─────────────────────
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const BouncingScrollPhysics(),
                children: const [
                  _Slide(
                    imageAsset: 'assets/images/onboard_cookies.png',
                    title:
                        'Siapa yang ga suka hadiah?\nKita semua SUKA hadiah!!',
                    description:
                        'Kalau kamu kayak kami, pasti suka banget dapetin kejutan manis!\nMakanya, kami hadir dengan program loyalitas paling lezat di dunia cookies!',
                  ),
                  _Slide(
                    imageAsset: 'assets/images/onboard_cupcake.png',
                    title:
                        'Cupcake itu kecil, manis, dan selalu siap bikin mood naik!',
                    description:
                        'Makanya, tiap kamu login, kami siap kasih reward yang seimut cupcake favorit kamu. Karena kamu pantas dimanjain! ✨🧁',
                  ),
                  _Slide(
                    imageAsset: 'assets/images/onboard_cake.png',
                    title:
                        'Hari seru dengan kue spesial!\nDapetin keseruannya!!',
                    description:
                        'Biar kayak ulang tahun tiap minggu, kami siap bagi-bagi hadiah lewat program loyalitas.\nAwas, bisa ketagihan manisnya! 🎉🍰',
                  ),
                ],
              ),
            ),

            // ───────────────────── BOTTOM BAR ─────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
              child: Row(
                children: [
                  TextButton(
                    onPressed: _skip,
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Tombol Next / Mulai
                  ElevatedButton(
                    onPressed: _next,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF7B658),
                      foregroundColor: const Color(0xFF593412),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (_, __) {
                        final isLast = (_controller.page ?? 0) >= 2;
                        return Text(
                          isLast ? 'Mulai' : 'Selanjutnya',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  const _Slide({
    required this.imageAsset,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 24),

              Expanded(
                child: Center(
                  child: Hero(
                    tag: imageAsset,
                    child: Image.asset(
                      imageAsset,
                      width: constraints.maxWidth * 0.6,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              TweenAnimationBuilder<double>(
                tween: Tween(begin: 40, end: 0),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
                builder: (_, value, child) {
                  return Transform.translate(
                    offset: Offset(0, value),
                    child: Opacity(opacity: (40 - value) / 40, child: child),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        height: 1.3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.4,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
