// lib/features/auth/presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/auth/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(LoggedIn('mice','123456'));
              },
              child: const Text('点击登录'),
            ),
          ),
          // BlocBuilder<AuthBloc, AuthState>(
          //   builder: (context, state) {
          //     if (state is AuthLoading) {
          //       return const CircularProgressIndicator();
          //     } else if (state is AuthAuthenticated) {
          //       final user = state.user;
          //       return Text('欢迎, ${user.username}, Token=${user.token}');
          //     } else if (state is AuthUnauthenticated) {
          //       return const Text('请登录');
          //     } else if (state is AuthError) {
          //       return Text('错误: ${state.message}');
          //     }
          //     return Container();
          //   },
          // )
        ],
      ),
    );
  }
}
