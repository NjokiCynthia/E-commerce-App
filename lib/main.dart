import 'package:ecommerce/screens/dashboard/bottom_navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      //theme: MyTheme.darkTheme,
      routes: {'/': (context) => const BottomNavBar()},
      initialRoute: '/',
    );
  }
}
