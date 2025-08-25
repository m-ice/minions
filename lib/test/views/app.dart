part of './index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            themeMode: ThemeMode.system,
            routerConfig: AppRouterConfig.appRouterList,
          );
        },
      ),
    );
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => Counter()),
    //   ],
    //   child:
    // );
  }
}
