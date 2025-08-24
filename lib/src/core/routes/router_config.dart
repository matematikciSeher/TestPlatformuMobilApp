// GoRouter configuration

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:testplatformu/src/core/services/navigationServices.dart';
import 'package:testplatformu/src/features/Splash/presentation/pages/splash_page.dart';
import 'package:testplatformu/src/features/anasayfa/anasayfa.dart';
import 'package:testplatformu/src/features/auth/presentation/pages/login_page.dart';
import 'package:testplatformu/src/features/auth/presentation/pages/register_page.dart';

final _rootNavigatorKey = NavigationService().navigatorKey;
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
Future<GoRouter> createRouter() async {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/anasayfa',
        builder: (context, state) => const Anasayfa(),
      ),
    ],
  );
}

final router = createRouter();
