import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/catalog/detail.dart';
import 'firebase_options.dart';
import 'screens/splash/splash.dart';
import 'screens/home/home.dart';
import 'screens/setting/setting.dart';
import 'providers/cart_manager.dart';
import 'screens/cart/cart.dart';
import 'screens/history/nota_page.dart';
import 'package:dobites/screens/checkout/checkout.dart';
import 'package:dobites/screens/address/address_page.dart';
import 'package:dobites/screens/address/add_address_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => CartProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cookie Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.brown),
      initialRoute: '/splash',

      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/setting': (context) => const SettingPage(),
        '/cart': (_) => const Cart(),
        '/checkout': (context) => const Checkout(),
        '/address': (context) => const AddressPage(),
        '/add-address': (context) => const AddAddressPage(),
        '/nota': (context) => const NotaPage(),
      },
    );
  }
}
