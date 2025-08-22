import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'anasayfa/anasayfa.dart';
import 'auth/login_page.dart';
import 'models/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Kullanıcı girişi kontrolü
  final prefs = await SharedPreferences.getInstance();
  final userData = prefs.getString('user');

  User? user;
  if (userData != null) {
    try {
      // Basit bir JSON parse işlemi (gerçek uygulamada daha güvenli olmalı)
      final userMap = Map<String, dynamic>.from(
        Map.fromEntries(
          userData
              .replaceAll('{', '')
              .replaceAll('}', '')
              .split(',')
              .map((e) {
                final parts = e.split(':');
                if (parts.length == 2) {
                  final key = parts[0].trim().replaceAll('"', '');
                  final value = parts[1].trim().replaceAll('"', '');
                  return MapEntry(key, value);
                }
                return MapEntry('', '');
              })
              .where((e) => e.key.isNotEmpty),
        ),
      );

      // Demo kullanıcı verisi oluştur
      user = User(
        id: '1',
        username: userMap['username'] ?? 'Kullanıcı',
        email: userMap['email'] ?? 'user@example.com',
        dersPerformanslari: {
          'Matematik': {
            '9.sınıf': 75.0,
            '10.sınıf': 68.0,
            '11.sınıf': 82.0,
            '12.sınıf': 70.0,
            'TYT': 78.0,
            'AYT': 85.0,
          },
          'Fizik': {
            '9.sınıf': 65.0,
            '10.sınıf': 72.0,
            '11.sınıf': 78.0,
            '12.sınıf': 80.0,
            'TYT': 75.0,
            'AYT': 82.0,
          },
          'Kimya': {
            '9.sınıf': 70.0,
            '10.sınıf': 75.0,
            '11.sınıf': 68.0,
            '12.sınıf': 73.0,
            'TYT': 70.0,
            'AYT': 78.0,
          },
          'Biyoloji': {
            '9.sınıf': 80.0,
            '10.sınıf': 85.0,
            '11.sınıf': 78.0,
            '12.sınıf': 82.0,
            'TYT': 85.0,
            'AYT': 88.0,
          },
          'Tarih': {
            '9.sınıf': 75.0,
            '10.sınıf': 70.0,
            '11.sınıf': 82.0,
            '12.sınıf': 78.0,
            'TYT': 80.0,
            'AYT': 85.0,
          },
          'Coğrafya': {
            '9.sınıf': 78.0,
            '10.sınıf': 82.0,
            '11.sınıf': 75.0,
            '12.sınıf': 80.0,
            'TYT': 78.0,
            'AYT': 82.0,
          },
        },
        genelKullanimYuzdesi: 78.5,
      );

      UserProvider.setUser(user);
    } catch (e) {
      // Hata durumunda kullanıcı girişi yapılmamış kabul et
      user = null;
    }
  }

  runApp(TestPlatformuApp(initialUser: user));
}

class TestPlatformuApp extends StatelessWidget {
  final User? initialUser;

  const TestPlatformuApp({super.key, this.initialUser});

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
      home: initialUser != null ? const Anasayfa() : const LoginPage(),
    );
  }
}
