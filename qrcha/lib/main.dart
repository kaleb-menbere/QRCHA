import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MeatMarketApp());
}

class MeatMarketApp extends StatelessWidget {
  const MeatMarketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRCHA',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // SUGGESTED ADDITIONS:
        useMaterial3: true, // Enable Material 3 design
        scaffoldBackgroundColor: Colors.grey[50], // Lighter background
      ),
      home: const HomePage(),
    );
  }
}