import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const brown = Color(0xFF7B5347);
  static const peach = Color(0xFFFCEDD6);

  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: peach,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: brown),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                Navigator.pop(context); // Tutup drawer
                Navigator.pushNamed(
                    context, '/setting'); // Navigasi ke halaman setting
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildHeroWithPromo(),
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Your favorites',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                  ),
                ),
                const SizedBox(height: 12),
                _buildFavorites(),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Container(height: 4, color: brown),
        Container(
          color: Colors.white.withAlpha((0.95 * 255).toInt()),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu, size: 28, color: Colors.black87),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              Image.network(
                'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/qf5m00y5_expires_30_days.png',
                width: 40,
                height: 40,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(
                    Icons.shopping_bag_outlined,
                    size: 28,
                    color: Colors.black87,
                  ),
                  Positioned(
                    right: -4,
                    top: -4,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4E8D7C),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '0',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(height: 4, color: brown),
      ],
    );
  }

  Widget _buildHeroWithPromo() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: WaveClipperOne(reverse: false),
          child: Container(
            color: brown,
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 120),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultTextStyle(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              'Selamat Pagi Arion!',
                              speed: Duration(milliseconds: 50),
                            ),
                          ],
                          isRepeatingAnimation: false,
                          pause: Duration.zero,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Yeayy, ayo makan cookies!',
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.network(
                      'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/gfko3hx7_expires_30_days.png',
                      width: 54,
                      height: 54,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -50,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 70, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontSize: 13, color: Colors.black87),
                          children: [
                            TextSpan(
                              text:
                                  'Dapetin Bonus Setiap Beli Red Velvet Cookies!\n',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text:
                                  'Setiap pembelian 2 Red Velvet Cookies langsung dapat bonus 70 poin.\nKumpulin poinnya, tukerin sama cookies gratis! ✨🍪',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 14),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: brown,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                          child: const Text('Beli Sekarang'),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 80,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 64,
                    decoration: const BoxDecoration(
                      color: Color(0xFF461111),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Promo Seru Buat Kamu~',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFFF6F2ED),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Red Velvet Cookies',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -12,
                  right: 8,
                  child: Image.network(
                    'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/ejwkgnvl_expires_30_days.png',
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFavorites() {
    final products = [
      {
        'img':
            'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/5h44lx9m_expires_30_days.png',
        'name': 'Red Velvet',
        'price': '15.000',
      },
      {
        'img':
            'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/zbujuk9b_expires_30_days.png',
        'name': 'Black Forest',
        'price': '20.000',
      },
      {
        'img':
            'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/uilydcg9_expires_30_days.png',
        'name': 'Chocolate Cupcake',
        'price': '20.000',
      },
    ];

    return SizedBox(
      height: 240,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (_, i) {
          final p = products[i];
          return _ProductCard(
            imageUrl: p['img']!,
            name: p['name']!,
            price: p['price']!,
          );
        },
      ),
    );
  }

  Widget _buildBottomNav() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 8,
        borderRadius: BorderRadius.circular(32),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BottomNavigationBar(
            currentIndex: _navIndex,
            onTap: (i) => setState(() => _navIndex = i),
            type: BottomNavigationBarType.fixed,
            backgroundColor: brown,
            selectedItemColor: peach,
            unselectedItemColor: Colors.white70,
            selectedFontSize: 0,
            unselectedFontSize: 0,
            items: [
              _navItem(Icons.home_rounded, 0),
              _navItem(Icons.cookie_outlined, 1),
              _navItem(Icons.local_pizza_outlined, 2),
              _navItem(Icons.star_outline, 3),
              _navItem(Icons.person_outline, 4),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(IconData icon, int index) {
    final isActive = index == _navIndex;
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isActive
              ? peach.withAlpha((0.2 * 255).toInt())
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: isActive ? 26 : 22,
          color: isActive ? peach : Colors.white70,
        ),
      ),
      label: '',
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String imageUrl, name, price;
  const _ProductCard({
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0D000000),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  imageUrl,
                  width: 160,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    size: 14,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 2),
            child: Text(name, style: const TextStyle(fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                children: [
                  const TextSpan(text: 'Rp'),
                  TextSpan(text: ' $price'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
