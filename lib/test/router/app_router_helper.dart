part of '../router/index.dart';

class AppRouterHelper {
  static BuildContext get _context => appNavigatorKey.currentContext!;

  /// 类似 Get.toNamed
  static void toName(
    String routeName, {
    Map<String, String>? params,
    Object? extra,
  }) {
    final uri = Uri(path: routeName, queryParameters: params);
    _context.push(uri.toString(), extra: extra);
  }

  /// 类似 Get.offNamed 类似 Get.offAllNamed 类似 Get.until - 清空栈并跳转到指定页面
  static void offNamed(
    String location, {
    Map<String, String>? params,
    Object? extra,
  }) {
    final uri = Uri(path: location, queryParameters: params);
    _context.go(uri.toString(), extra: extra);
  }

  static void offAllNamed(
    String location, {
    Map<String, String>? params,
    Object? extra,
  }) {
    final uri = Uri(path: location, queryParameters: params);
    _context.go(uri.toString(), extra: extra);
  }

  static void until(
    String location, {
    Map<String, String>? params,
    Object? extra,
  }) {
    final uri = Uri(path: location, queryParameters: params);
    _context.go(uri.toString(), extra: extra);
  }

  /// 替代 Get.off - pushReplacement
  static void off(String location, {Object? extra}) {
    _context.pushReplacement(location, extra: extra);
  }

  static void pushNamed(
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    _context.pushNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  static void replace(String location, {Object? extra}) {
    _context.replace(location, extra: extra);
  }

  static void replaceNamed(
    String routeName, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    _context.replaceNamed(
      routeName,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
      extra: extra,
    );
  }

  /// 类似 Get.back()
  static void back() {
    if (canPop) {
      appNavigatorKey.currentState?.pop();
    }
  }

  /// 是否能Pop
  static bool get canPop => _context.canPop();

  /// 模拟 Get.currentRoute，获取当前路由路径（带 query）
  static String get currentRouter {
    return GoRouter.of(_context).state.uri.path;
  }

  static GoRouterState get currentRouterState {
    return GoRouter.of(_context).state;
  }

  /// 当前屏幕大小
  static Size get size {
    return MediaQuery.sizeOf(_context);
  }
}
