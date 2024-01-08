import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:learnflutter/auth/auth_provider.dart';

import 'package:learnflutter/pages/chat/view/chat_view.dart';
import 'package:learnflutter/pages/login/view/login_view.dart';
import 'package:learnflutter/pages/splash/splash_view.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _key,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/',
        name: 'spot_chat',
        builder: (context, state) {
          return const ChatView();
        },
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return const LoginView();
        },
      ),
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) {
          return const SplashView();
        },
      ),
    ],
    redirect: (context, state) {
      final isAuth = authState.valueOrNull != null;
      // log('auth value: ${authState.value}');
      log('isAuth : $isAuth');

      final isSplash = state.matchedLocation == '/splash';
      log('is splash page ?: $isSplash');
      if (isSplash) {
        return isAuth ? '/' : '/login';
      }

      final isLogIn = state.matchedLocation == '/login';
      log('is login page ?: $isLogIn');
      if (isLogIn) return isAuth ? '/' : null;

      return isAuth ? null : '/splash';
    },
  );
});
