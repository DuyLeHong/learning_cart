import 'package:flutter/material.dart';
import 'package:learning_cart/pages/cart_page/cart_page.dart';
import 'package:learning_cart/pages/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: CartPage(),
      // home: const HomePage(),
      initialRoute: "home_page",
      routes: {
        "home_page": (context) {
          return const HomePage();
        },
        "cart_page": (context) {
          return CartPage();
        },
      },
    );
  }
}
