import 'package:flutter/material.dart';
import '../../data/products.dart';
import '../../models/product.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  // Palet warna dan aset yang sama dengan Home
  static const brown = Color(0xFF7B5347);
  static const peach = Color(0xFFFCEDD6);

  int _navIndex = 1; // posisi "Catalog" di BottomNav

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: peach,
      drawer: _buildDrawer(context),
      bottomNavigationBar: _buildBottomNav(),
      body: Stack(
        children: [
          // ---- Layer gambar latar penuh ----
          Positioned.fill(
            child: Image.asset('assets/images/bg_full.png', fit: BoxFit.cover),
          ),

          // ---- Layer konten utama ----
          SafeArea(
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 16),
                Expanded(child: _buildGrid()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------- HEADER (sama dengan Home) ----------
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
              const Icon(
                Icons.shopping_bag_outlined,
                size: 28,
                color: Colors.black87,
              ),
            ],
          ),
        ),
        Container(height: 4, color: brown),
      ],
    );
  }

  // ---------- GRID PRODUK ----------
  Widget _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: allProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Tiga kolom
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (_, i) {
        final product = allProducts[i];
        return _ProductTile(product: product);
      },
    );
  }

  // ---------- DRAWER ----------
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: brown),
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
      ),
    );
  }

  // ---------- BOTTOM NAV ----------
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _navIndex,
      backgroundColor: brown,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
      onTap: (i) {
        if (i == _navIndex) return; // sudah di halaman ini
        setState(() => _navIndex = i);
        if (i == 0) {
          // Kembali ke Home
          Navigator.popUntil(context, (route) => route.isFirst);
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

// -------------------------------------------------
// Kartu Produk di Grid
// -------------------------------------------------
class _ProductTile extends StatelessWidget {
  final Product product;
  const _ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 4),
                Text(
                  'Rp${product.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
