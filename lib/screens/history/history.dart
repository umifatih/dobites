import 'package:flutter/material.dart';
import '../widgets/app_bottom_nav.dart';
import '../widgets/cart_icon_badge.dart';
import '../../../services/order_storage.dart';
import '../../../models/order_model.dart';
import 'package:dobites/data/products.dart';
import 'package:dobites/models/product.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  static const brown = Color(0xFF7B5347);
  static const peach = Color(0xFFFCEDD6);

  Future<List<Order>>? _futureOrders;

  @override
  void initState() {
    super.initState();
    _futureOrders = OrderStorage.getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: peach,
        drawer: _buildDrawer(context),
        bottomNavigationBar: const AppBottomNav(current: 2),
        body: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  'assets/images/bg_full.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  _buildHeader(context),
                  _buildTabBar(),
                  Expanded(child: _buildTabBarView()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Container(height: 4, color: brown),
        Container(
          color: Colors.white.withAlpha(242),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.notifications_none,
                  size: 28,
                  color: Colors.black87,
                ),
                onPressed: () => Navigator.pushNamed(context, '/notifikasi'),
              ),
              Image.network(
                'https://storage.googleapis.com/tagjs-prod.appspot.com/v1/NVgUSymWEI/qf5m00y5_expires_30_days.png',
                width: 40,
                height: 40,
              ),
              CartIconWithBadge(
                onPressed: () => Navigator.pushNamed(context, '/cart'),
                icon: Icons.shopping_cart_outlined,
              ),
            ],
          ),
        ),
        Container(height: 4, color: brown),
      ],
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: const Color(0xFFFBE8DB),
      child: const TabBar(
        indicatorColor: Color(0xFFFF6B57),
        labelColor: Color(0xFFFF6B57),
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.normal),
        tabs: [
          Tab(text: "Semua"),
          Tab(text: "Dikirim"),
          Tab(text: "Selesai"),
          Tab(text: "Dibatalkan"),
        ],
      ),
    );
  }

  Widget _buildTabBarView() {
    return FutureBuilder<List<Order>>(
      future: _futureOrders,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final orders = snapshot.data!;
        final semua = orders;
        final dikirim = orders.where((o) => o.status == 'Dikirim').toList();
        final selesai = orders.where((o) => o.status == 'Selesai').toList();
        final batal = orders.where((o) => o.status == 'Dibatalkan').toList();

        return TabBarView(
          children: [
            semua.isEmpty ? _buildEmptyHistory() : _buildOrderList(semua),
            dikirim.isEmpty ? _buildEmptyHistory() : _buildOrderList(dikirim),
            selesai.isEmpty ? _buildEmptyHistory() : _buildOrderList(selesai),
            batal.isEmpty ? _buildEmptyHistory() : _buildOrderList(batal),
          ],
        );
      },
    );
  }

  Widget _buildOrderList(List<Order> orders) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];

        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/nota', arguments: order),
          child: Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal: ${order.date}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Total Bayar: Rp${order.total}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Produk:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  ...order.items.map((item) {
                    Product? product;
                    try {
                      product = allProducts.firstWhere(
                        (p) => p.id == item['id'],
                      );
                    } catch (_) {
                      product = null;
                    }
                    final image = product?.imageUrl;
                    return Row(
                      children: [
                        if (image != null)
                          Image.asset(
                            image,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          )
                        else
                          const Icon(Icons.image, size: 40, color: Colors.grey),
                        const SizedBox(width: 8),
                        Expanded(child: Text(item['name'] ?? '-')),
                        Text("x${item['qty']}"),
                      ],
                    );
                  }).toList(),
                  if (order.status == 'Dikirim') ...[
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () async {
                          order.status = 'Selesai';
                          await OrderStorage.updateOrder(order);
                          setState(() {
                            _futureOrders = OrderStorage.getOrders();
                          });
                        },
                        child: const Text('Tandai Selesai'),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FutureBuilder<bool>(
                        future: _isCancellable(order),
                        builder: (context, snapshot) {
                          final canCancel = snapshot.data ?? false;
                          return TextButton(
                            onPressed: canCancel
                                ? () async {
                                    order.status = 'Dibatalkan';
                                    await OrderStorage.updateOrder(order);
                                    setState(() {
                                      _futureOrders = OrderStorage.getOrders();
                                    });
                                  }
                                : null,
                            child: Text(
                              'Batalkan Pesanan',
                              style: TextStyle(
                                color: canCancel ? Colors.red : Colors.grey,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> _isCancellable(Order order) async {
    try {
      final createdTime = DateTime.parse(order.date);
      final now = DateTime.now();
      return now.difference(createdTime).inSeconds > 10;
    } catch (_) {
      return false;
    }
  }

  Widget _buildEmptyHistory() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Image.asset('assets/images/empty_history.png', height: 200),
          const SizedBox(height: 24),
          const Text(
            "Belum ada riwayat pesanan",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          const Text(
            "Ayo mulai belanja dan temukan produk favoritmu!\nSemua pesananmu akan muncul di sini.",
            style: TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: brown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            ),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              '/catalog',
              (route) => false,
            ),
            child: const Text(
              "Mulai Belanja",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: brown),
            child: Text(
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
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifikasi'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/notifikasi');
            },
          ),
        ],
      ),
    );
  }
}
