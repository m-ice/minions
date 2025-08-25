import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'app/di.dart';
import 'injection.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  setupDI();
  Bloc.observer = AppBlocObserver(); // 全局绑定
  runApp(App());
}