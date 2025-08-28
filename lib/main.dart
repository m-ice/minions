import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'app/di.dart';
import 'features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'injection.dart' hide getIt;

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  setupDI();
  Bloc.observer = AppBlocObserver(); // 全局绑定
  AuthBloc authBloc=getIt();
  authBloc.add(AppStarted()); // ✅ 启动时触发检查
  runApp(App(authBloc: authBloc,));
}