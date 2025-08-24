import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:testplatformu/models/user_model.dart';

class TestPlatformuApp extends StatelessWidget {
  final User? initialUser;
  final GoRouter routerConfig;

  const TestPlatformuApp({super.key, this.initialUser, required this.routerConfig});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: routerConfig,
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
        );
      },
    );
  }
}
