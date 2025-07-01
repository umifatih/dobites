import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'firebase_options.dart';
import 'screens/splash/splash.dart';
import 'screens/home/home.dart';
import 'screens/setting/setting.dart';
import 'screens/cart/cart.dart';
import 'screens/checkout/checkout.dart';
import 'screens/address/address_page.dart';
import 'screens/address/add_address_page.dart';
import 'screens/history/nota_page.dart';
import 'screens/history/history.dart';
import 'screens/profile/profile.dart';
import 'screens/profile/help.dart';
import 'models/order_model.dart'; //
import 'package:intl/date_symbol_data_local.dart';
import 'package:dobites/screens/profile/faq.dart';
import 'package:dobites/screens/auth/change_password_page.dart';
import 'package:dobites/screens/profile/privacy_terms_page.dart';
import 'package:dobites/screens/voucher/voucher_page.dart'; //
import 'package:dobites/screens/auth/sign_in.dart';
import 'screens/widgets/notification_icon_badge.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await initializeDateFormatting('id_ID', null);

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
      title: 'Dobites',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.brown),
      initialRoute: '/splash',

      // ✅ Pakai ini untuk route yang butuh arguments seperti NotaPage
      onGenerateRoute: (settings) {
        if (settings.name == '/nota') {
          final order = settings.arguments as Order;
          return MaterialPageRoute(builder: (_) => NotaPage(order: order));
        }

        // Tambahkan default fallback jika route tidak ditemukan
        return null;
      },

      // ✅ Gunakan ini untuk route biasa tanpa arguments
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/setting': (context) => const SettingPage(),
        '/cart': (context) => const Cart(),
        '/checkout': (context) => const Checkout(),
        '/address': (context) => const AddressPage(),
        '/add-address': (context) => const AddAddressPage(),
        '/history': (context) => const HistoryPage(),
        '/profile': (context) => const ProfilePage(),
        '/help': (context) => const BantuanPage(),
        '/faq': (context) => const FAQPage(),
        '/change-password': (context) => const ChangePasswordPage(),
        '/privacytermspage': (context) => const PrivacyTermsPage(),
        '/voucher': (context) => const VoucherPage(),
        '/sign-in': (context) => const SignIn(),
        // ❌ Jangan tulis '/nota' di sini lagi karena sudah diatur di `onGenerateRoute`
      },
    );
  }
}
