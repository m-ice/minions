import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minions/app/theme.dart';

import '../blocs/auth/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 120,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._-]')),
              ],
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 60
              ),
              child: TextField(
                obscureText:true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  context.read<AuthBloc>().add(LoggedIn('mice','123456'));
                },
                child: Ink(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor
                    ),
                    child: Center(child: DefaultTextStyle(style: AppTheme.darkTheme.textTheme.bodyMedium!,
                        child: const Text('点击登录'))

                    )),
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
      ),
    );
  }
}
