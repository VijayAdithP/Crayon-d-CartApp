import 'package:crayondcart/Provider/CartProvider.dart';
import 'package:crayondcart/Screens/CartPage.dart';
import 'package:crayondcart/Screens/CatalogPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: const HomePage(),
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'ProductSans',
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
            color: Colors.grey[600],
            fontSize: 16,
          ),
          bodyMedium: const TextStyle(
            fontSize: 17,
          ),
          displaySmall: const TextStyle(
            color: Colors.red,
            fontSize: 14.0,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CartPage(),
        '/CatalogPage': (context) => const CatalogPage(),
      },
      // home: const CartPage(),
    );
  }
}
