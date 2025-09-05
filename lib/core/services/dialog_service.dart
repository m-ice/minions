import 'dart:collection';

import 'package:flutter/material.dart';

import '../../app/di.dart';

class DialogService {
  static final DialogService _instance = DialogService._internal();

  factory DialogService() => _instance;

  DialogService._internal();

  final GlobalKey<NavigatorState> navigatorKey = getIt();

  final Queue<Future Function()> _dialogQueue = Queue();
  bool _isShowing = false;

  /// 添加弹窗到队列
  void enqueueDialog(Future Function() dialogTask) {
    _dialogQueue.add(dialogTask);
    _tryShowNext();
  }

  void _tryShowNext() {
    if (_isShowing || _dialogQueue.isEmpty) return;

    final task = _dialogQueue.removeFirst();
    _isShowing = true;
    task().whenComplete(() {
      _isShowing = false;
      _tryShowNext();
    });
  }

  /// 队列封装 - 普通对话框
  void showAppDialog(Widget dialog, {bool barrierDismissible = false}) {
    enqueueDialog(() async {
      return showDialog(
        context: navigatorKey.currentContext!,
        barrierDismissible: barrierDismissible,
        builder: (_) => dialog,
      );
    });
  }

  /// 队列封装 - BottomSheet
  void showBottomSheet(Widget sheet) {
    enqueueDialog(() async {
      return showModalBottomSheet(
        context: navigatorKey.currentContext!,
        builder: (_) => sheet,
      );
    });
  }

  /// Snackbar 不排队，立即展示（避免阻塞）
  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      navigatorKey.currentContext!,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
