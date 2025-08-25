// lib/app/app_bloc_observer.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // 监听所有 Bloc 的事件
    print('[Bloc Event] ${bloc.runtimeType}, Event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    // Cubit 的状态变化（包括 Bloc 内部）
    print('[Bloc Change] ${bloc.runtimeType}, Change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // Bloc 的状态变化（包含 event -> state 流程）
    print('[Bloc Transition] ${bloc.runtimeType}, Transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // 捕获 Bloc/Cubit 的错误
    print('[Bloc Error] ${bloc.runtimeType}, Error: $error');
    super.onError(bloc, error, stackTrace);
  }
}
