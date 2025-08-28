// lib/app/router.dart
import 'package:go_router/go_router.dart';
import '../features/auth/presentation/blocs/auth/auth_bloc.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';
import 'go_router_refresh_stream.dart';

class AppRouter {
  static GoRouter create(AuthBloc authBloc) {
    return GoRouter(
      initialLocation: '/',
      refreshListenable: GoRouterRefreshStream(authBloc.stream),
      redirect: (context, state) {
        final authState = authBloc.state;
        if (authState is AuthInitial || authState is AuthLoading) {
          return '/'; //  加载中，留在 Splash
        }

        final loggingIn = state.matchedLocation == '/login';

        if (authState is Unauthenticated && !loggingIn) {
          return '/login'; // 去登录
        }

        if (authState is Authenticated && (loggingIn||state.matchedLocation == '/')) {
          return '/home'; //  已登录，去主页
        }

        return null; // 默认不跳转
      },
      routes: [
        GoRoute(path: '/', builder: (_, __) => const SplashPage()),
        GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
        GoRoute(path: '/home', builder: (_, __) => const HomePage()),
      ],
    );
  }
}
