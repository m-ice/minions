// lib/app/router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/blocs/auth/auth_bloc.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import 'go_router_refresh_stream.dart';

class AppRouter {
  static GoRouter create(AuthBloc authBloc) {
    // return GoRouter(
    //   initialLocation: '/',
    //   refreshListenable: GoRouterRefreshStream(authBloc.stream),
    //   routes: [
    //     GoRoute(
    //       path: '/',
    //       name: 'splash',
    //       builder: (context, state) => const SplashPage(),
    //     ),
    //     GoRoute(
    //       path: '/login',
    //       name: 'login',
    //       builder: (context, state) => const LoginPage(),
    //     ),
    //     GoRoute(
    //       path: '/home',
    //       name: 'home',
    //       builder: (context, state) => const HomePage(),
    //     ),
    //   ],
    //   redirect: (context, state) {
    //     final authState = authBloc.state;
    //
    //     final loggingIn = state.matchedLocation == '/login';
    //     print("看一看 $loggingIn $authState");
    //     if (authState is Unauthenticated && !loggingIn) {
    //       return '/login';
    //     }
    //     if (authState is Authenticated && loggingIn) {
    //       return '/home';
    //     }
    //     return null;
    //   },
    // );
    return GoRouter(
      initialLocation: '/',
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      routes: [
        GoRoute(path: '/', builder: (_, __) => const SplashPage()),
        GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
        GoRoute(path: '/home', builder: (_, __) => const HomePage()),
      ],
      redirect: (context, state) {
        final authState = authBloc.state;

        // 如果还在加载 Splash 或 Loading，返回 null 先显示 Splash
        if (authState is AuthInitial || authState is AuthLoading) {
          return null;
        }

        final loggingIn = state.matchedLocation == '/login';

        if (authState is Unauthenticated && !loggingIn) {
          return '/login';
        }

        if (authState is Authenticated && loggingIn) {
          return '/home';
        }

        return null;
      },
    );
  }
}
