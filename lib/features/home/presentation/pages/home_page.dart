import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/app.dart';
import '../../../auth/presentation/blocs/auth/auth_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页'),
      actions: [

        IconButton(onPressed: (){
          if (App.themeNotifier.value == ThemeMode.light) {
            App.themeNotifier.value = ThemeMode.dark;
          } else {
            App.themeNotifier.value = ThemeMode.light;
          }
        }, icon: Icon(
            App.themeNotifier.value ==
                ThemeMode.light?Icons.nights_stay:Icons.wb_sunny),),
      ],),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(LoggedOut());
          },
          child: const Text('退出登录'),
        ),
      ),
    );
  }
}