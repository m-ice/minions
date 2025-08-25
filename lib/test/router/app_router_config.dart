part of '../router/index.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppRouterConfig {
  static const String home = "/";
  static const String splash = "/splash";
  static const String counter = "/counter";
  static const String test = "/test";

  static final GoRouter appRouterList = GoRouter(
    navigatorKey: appNavigatorKey, // 添加这行
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView(),
        routes: [
          GoRoute(
            path: 'splash',
            builder: (BuildContext context, GoRouterState state) =>
                const SplashView(),
          ),
          GoRoute(
            path: 'counter',
            builder: (BuildContext context, GoRouterState state) =>
                const CounterView(),
          ),

          GoRoute(
            path: 'test',
            builder: (BuildContext context, GoRouterState state) =>
                 CounterApp(),
          ),
        ],
      ),
    ],
  );
}
