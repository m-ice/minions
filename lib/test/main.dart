import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './views/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const CounterObserver();
  runApp(const App());
}

class CounterObserver extends BlocObserver{

  const CounterObserver();


  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    print('测试一下 ${bloc.runtimeType} $change');
  }

}

