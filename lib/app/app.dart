import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minions/app/router.dart';
import 'package:minions/app/theme.dart';
import 'package:minions/core/services/dialog_service.dart';
import '../features/auth/presentation/blocs/auth/auth_bloc.dart';
import '../injection.dart';

class App extends StatelessWidget {
  final AuthBloc authBloc;
  const App({super.key, required this.authBloc});

  // 保存当前主题模式
  static final ValueNotifier<ThemeMode> themeNotifier =
  ValueNotifier(ThemeMode.light);
  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(value: authBloc,
      child: ValueListenableBuilder<ThemeMode>(
          valueListenable: themeNotifier,
          builder: (_, mode, __) {
          return MaterialApp.router(
            key: DialogService().navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode, // 跟随系统
            routerConfig: AppRouter.create(authBloc),
          );
        }
      ),
    );
  }
}