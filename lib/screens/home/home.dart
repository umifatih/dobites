import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../models/product.dart';
import '../../data/products.dart';
import '../catalog/catalog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const brown = Color(0xFF7B5347);
  static const peach = Color(0xFFFCEDD6);

  final _uid = FirebaseAuth.instance.currentUser!.uid;
  late final Stream<QuerySnapshot> _favStream;
  int _navIndex = 0;

  @override
  void initState() {
    super.initState();
    _favStream = FirebaseFirestore.instance
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .snapshots();
  }

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
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Pengaturan'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/setting');
              },
            ),
          ],
<<<<<<< HEAD
=======
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_pattern.png'),
            fit: BoxFit.none,
          ),
>>>>>>> 48e279035d63ab5d122bcc888d5cda03fa26a684
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          stream: _favStream,
          builder: (context, snap) {
            if (snap.hasError) {
              return const Center(child: Text('Gagal memuat favorit'));
            }
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

<<<<<<< HEAD
            final favIds =
                snap.data?.docs.map((d) => d.id).toSet() ?? <String>{};
            final recommend =
                allProducts.where((p) => !favIds.contains(p.id)).toList()
                  ..shuffle(Random(_uid.hashCode));
            final recommend6 = recommend.take(6).toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildHero(), // WAVE sekarang hanya di bagian ini
                  const SizedBox(height: 16),
                  _buildPromoCard(),
                  const SizedBox(height: 24),
                  if (recommend6.isNotEmpty) ...[
=======
              final favIds =
                  snap.data?.docs.map((d) => d.id).toSet() ?? <String>{};
              final recommend =
                  allProducts.where((p) => !favIds.contains(p.id)).toList()
                    ..shuffle(Random(_uid.hashCode));
              final recommend6 = recommend.take(6).toList();

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    _buildHero(),
                    const SizedBox(height: 16),
                    _buildPromoCard(),
                    const SizedBox(height: 24),
                    if (recommend6.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recommended for you',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/catalog'),
                              child: const Text('See all'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      _horizontalList(recommend6),
                      const SizedBox(height: 24),
                    ],
>>>>>>> 48e279035d63ab5d122bcc888d5cda03fa26a684
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rekomendasi untukmu',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, '/catalog'),
                            child: const Text('Lihat Semua'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    _horizontalList(recommend6),
                    const SizedBox(height: 24),
                  ],
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
                  favIds.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 32,
                          ),
                          child: Text('Belum ada produk favorit 😋'),
                        )
                      : _horizontalList(
                          allProducts
                              .where((p) => favIds.contains(p.id))
                              .toList(),
                          isFavoriteList: true,
                        ),
                  const SizedBox(height: 32),
                ],
              ),
            );
          },
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
                  icon: const Icon(Icons.menu, size: 28, color: Colors.black87),
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

  Widget _horizontalList(
    List<Product> products, {
    bool isFavoriteList = false,
  }) {
    return SizedBox(
      height: 240,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (_, i) =>
            _ProductCard(product: products[i], isFavorite: isFavoriteList),
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      height: 160, // pastikan cukup tinggi agar wave terlihat
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_pattern.png'),
          fit: BoxFit.cover,
          alignment: Alignment.topRight, // sesuaikan jika perlu
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Selamat pagi, Arion!',
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Yeayy, ayo makan cookies!',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.network(
                '"https://storage.googleapis.com/tagjs-prod.appspot.com/v1/omyEq7yTCY/d41eljzr_expires_30_days.png",',
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

  Widget _buildPromoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
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
            padding: const EdgeInsets.fromLTRB(16, 45, 16, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Dapetin Bonus Setiap Beli Red Velvet Cookies!',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Setiap pembelian 2 Red Velvet Cookies langsung '
                  'dapat bonus 70 poin.\nKumpulin poinnya, tukerin sama '
                  'cookies gratis! ✨🍪',
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF461111),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                    ),
                    child: const Text(
                      'Beli Sekarang',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                color: Color(0xFF461111),
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.only(
                  top: 8,
                ), // geser teks ke bawah dalam box-nya
                child: Text(
                  'Red Velvet Cookies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 16,
            top: 4,
            child: Text(
              'Promo Seru Buat Kamu~',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xFFF6F2ED),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
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

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _navIndex,
      backgroundColor: brown,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      onTap: (i) {
        setState(() => _navIndex = i);
        if (i == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CatalogPage()),
          );
        }
      },
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

/* Kartu produk interaktif */
class _ProductCard extends StatefulWidget {
  final Product product;
  final bool isFavorite;
  const _ProductCard({required this.product, this.isFavorite = false});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  late bool _fav;
  late final String _uid;

  @override
  void initState() {
    super.initState();
    _fav = widget.isFavorite;
    _uid = FirebaseAuth.instance.currentUser!.uid;
  }

  Future<void> _toggle() async {
    final ref = FirebaseFirestore.instance
        .collection('users')
        .doc(_uid)
        .collection('favorites')
        .doc(widget.product.id);

    try {
      _fav ? await ref.delete() : await ref.set(widget.product.toMap());
      if (!mounted) return;
      setState(() => _fav = !_fav);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Gagal mengubah favorit')));
    }
  }

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
                child: widget.product.imageUrl.startsWith('http')
                    ? Image.network(
                        widget.product.imageUrl,
                        width: 160,
                        height: 140,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        widget.product.imageUrl,
                        width: 160,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: InkWell(
                  onTap: _toggle,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _fav ? Icons.favorite : Icons.favorite_border,
                      size: 16,
                      color: _fav ? Colors.redAccent : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 2),
            child: Text(
              widget.product.name,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Rp${widget.product.price}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
