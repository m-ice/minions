// lib/app/app_router.dart
part of 'index.dart';

final GlobalKey<NavigatorState> appNavigatorKey = getIt();

class AppRouter {
  static const String splash = "/";
  static const String auth = "/auth";
  static const String home = "/home";
  static const String detail = "/detail";

  static GoRouter create(AuthBloc authBloc) {
    return GoRouter(
      navigatorKey: appNavigatorKey,
      initialLocation: splash,
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (context, state) {
        final authState = authBloc.state;
        if (authState is AuthInitial || authState is AuthLoading) {
          return splash; //  加载中，留在 Splash
        }

        final loggingIn = state.matchedLocation == auth;

        if (authState is Unauthenticated && !loggingIn) {
          return auth; // 去登录
        }

        if (authState is Authenticated &&
            (loggingIn || state.matchedLocation == splash)) {
          return home; //  已登录，去主页
        }

        return null; // 默认不跳转
      },
      routes: [
        GoRoute(
          path: splash,
          pageBuilder: (_, __) =>
              _platformPage(key: __.pageKey, child: const SplashPage()),
        ),
        GoRoute(
          path: auth,
          pageBuilder: (_, __) =>
              _platformPage(key: __.pageKey, child: const AuthPage()),
        ),
        GoRoute(
          path: home,
          pageBuilder: (_, __) =>
              _platformPage(key: __.pageKey, child: const HomePage()),
        ),
        GoRoute(
          path: detail,
          pageBuilder: (_, __) =>
              _platformPage(key: __.pageKey, child: const DetailPage()),
        ),
      ],
    );
  }

  /// 模拟 defaultTransition: Transition.cupertino
  // static CustomTransitionPage _buildCupertinoPage({
  //   required LocalKey key,
  //   required Widget child,
  // }) {
  //   return CustomTransitionPage(
  //     key: key,
  //     child: child,
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       return CupertinoPageTransition(
  //         primaryRouteAnimation: animation,
  //         secondaryRouteAnimation: secondaryAnimation,
  //         linearTransition: true,
  //         child: child,
  //       );
  //     },
  //   );
  // }

  /// 根据平台返回不同的 Page
  static Page _platformPage({required LocalKey key, required Widget child}) {
    // if (Platform.isIOS) {
    //   return CupertinoPage(key: key, child: child);
    // } else {
    //   return MaterialPage(key: key, child: child);
    // }
    return CupertinoPage(key: key, child: child);
  }
}
