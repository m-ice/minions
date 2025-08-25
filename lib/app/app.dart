import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minions/app/router.dart';

import '../features/auth/presentation/blocs/auth/auth_bloc.dart';
import '../injection.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    AuthBloc authBloc = getIt();

    return BlocProvider.value(
      value: authBloc,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.create(getIt()),
      ),
    );
  }
}
