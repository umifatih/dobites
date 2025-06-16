import 'package:flutter/material.dart';

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
      bottomNavigationBar: _buildBottomNav(),
      body: Container(
        // pola cupcake/cookie (boleh di-comment kalau tak punya pattern)
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
                _buildHero(),
                const SizedBox(height: 16),
                _buildPromoCard(),
                const SizedBox(height: 24),
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

  /* -------------------------------------------------- *
   *  HEADER (2 strip cokelat + menu, cookie logo, cart)
   * -------------------------------------------------- */
  Widget _buildHeader() {
    return Column(
      children: [
        Container(height: 4, color: brown), // strip atas
        Container(
          color: Colors.white.withAlpha((0.95 * 255).toInt()),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.menu, size: 28, color: Colors.black87),

              /* cookie logo — pakai assets atau network */
              Image.network(
                'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/qf5m00y5_expires_30_days.png',
                width: 40,
                height: 40,
              ),

              /* icon cart + badge */
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
        Container(height: 4, color: brown), // strip bawah
      ],
    );
  }

  /* -------------------------------------------------- *
   *  HERO brown dengan inisial & tagline
   * -------------------------------------------------- */
  Widget _buildHero() {
    return Container(
      color: brown,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* huruf S + tagline */
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'S',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Yeayy, ayo makan cookies!',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),

          /* avatar (memoji) */
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
    );
  }

  /* -------------------------------------------------- *
   *  CARD PROMO Red Velvet
   * -------------------------------------------------- */
  Widget _buildPromoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /* Kartu putih */
          Container(
            margin: const EdgeInsets.only(top: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dapetin Bonus Setiap Beli Red Velvet Cookies!',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Setiap pembelian 2 Red Velvet Cookies langsung '
                  'dapat bonus 70 poin.\nKumpulin poinnya, tukerin sama '
                  'cookies gratis! ✨🍪',
                  style: TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 12),
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
                        horizontal: 24,
                        vertical: 8,
                      ),
                    ),
                    child: const Text('Beli Sekarang'),
                  ),
                ),
              ],
            ),
          ),

          /* header maroon di atas kartu */
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFF461111),
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Red Velvet Cookies',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /* label promo kecil */
          const Positioned(
            left: 16,
            top: 4,
            child: Text(
              'Promo Seru Buat Kamu~',
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFFF6F2ED),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          /* gambar cookie merah */
          Positioned(
            right: 8,
            top: -12,
            child: Image.network(
              'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/ejwkgnvl_expires_30_days.png',
              width: 90,
              height: 90,
            ),
          ),
        ],
      ),
    );
  }

  /* -------------------------------------------------- *
   *  LIST horizontal “Your favorites”
   * -------------------------------------------------- */
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

  /* -------------------------------------------------- *
   *  Bottom Navigation
   * -------------------------------------------------- */
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _navIndex,
      backgroundColor: brown,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      onTap: (i) => setState(() => _navIndex = i),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.cookie_outlined), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_pizza_outlined),
          label: '',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.star_outline), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
      ],
    );
  }
}

/* ------------------------------------------------------ *
 *  Kartu produk kecil (gambar + nama + harga + heart)
 * ------------------------------------------------------ */
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
          /* gambar + heart */
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
