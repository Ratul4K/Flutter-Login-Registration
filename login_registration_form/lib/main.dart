
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Registration Form',

      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F7F4),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF174C3C),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF5F7F4),
          foregroundColor: Color(0xFF174C3C),
          elevation: 0,
        ),
      ),

      home: LoginPage(),
    );
  }
}
