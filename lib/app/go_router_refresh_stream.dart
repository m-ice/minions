// lib/app/go_router_refresh_stream.dart
import 'dart:async';
import 'package:flutter/foundation.dart';

/// 把 Stream<T> 转换成 ChangeNotifier
/// go_router 会在数据变化时调用 notifyListeners 刷新路由
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyOn(stream);
  }

  late final StreamSubscription<dynamic> _subscription;

  void notifyOn(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
