import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:minions/app/router/index.dart';
import 'package:minions/app/theme.dart';

import '../features/auth/presentation/blocs/auth/auth_bloc.dart';

class App extends StatelessWidget {
  final AuthBloc authBloc;

  const App({required this.authBloc, super.key});

  // 保存当前主题模式
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
    ThemeMode.light,
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // 竖屏设计稿尺寸
      minTextAdapt: true,
      splitScreenMode: true, // 横竖屏分开适配
      builder: (context, child) {
        return BlocProvider.value(
          value: authBloc,
          child: ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (_, mode, __) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: mode,
                // 跟随系统
                routerConfig: AppRouter.create(authBloc),
              );
            },
          ),
        );
      },
    );
  }
}
