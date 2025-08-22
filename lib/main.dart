import 'package:flutter/material.dart';
import 'anasayfa/anasayfa.dart';

void main() {
  runApp(const TestPlatformuApp());
}

class TestPlatformuApp extends StatelessWidget {
  const TestPlatformuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Platformu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6C63FF),
          foregroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const Anasayfa(),
    );
  }
}
