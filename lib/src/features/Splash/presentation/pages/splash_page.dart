import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/widgets.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController? _logoController;
  AnimationController? _textController;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startAnimations();
  }

  void _initializeAnimations() {
    // Logo animasyon controller'ı
    _logoController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Text animasyon controller'ı
    _textController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  void _startAnimations() async {
    // Logo animasyonunu başlat
    _logoController?.forward();

    // 300ms bekle, sonra text animasyonunu başlat
    await Future.delayed(const Duration(milliseconds: 300));
    _textController?.forward();

    // Animasyonlar tamamlandıktan sonra login sayfasına git
    // Logo animasyonu 800ms + Text animasyonu 600ms = toplam ~1400ms
    // Biraz daha bekleyip login'e yönlendir
    await Future.delayed(const Duration(milliseconds: 1500));

    if (mounted) {
      final prefs = await SharedPreferences.getInstance();
      final user = prefs.getString('user');
      if (user != null) {
        context.go('/anasayfa');
      } else {
        context.go('/login');
      }
    }
  }

  @override
  void dispose() {
    _logoController?.dispose();
    _textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.primary,
      body: Center(
        child: SplashContent(
          logoController: _logoController,
          textController: _textController,
          backgroundColor: theme.colorScheme.secondary,
          textColor: theme.colorScheme.onPrimary,
          appName: 'Sorucam',
        ),
      ),
    );
  }
}
