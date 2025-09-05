import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/// --------- 示例 Bloc ---------
class AuthBloc extends Cubit<bool> {
  AuthBloc() : super(false);

  void login() => emit(true);

  void logout() => emit(false);
}

final authBloc = AuthBloc();
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

/// --------- 根 App ---------
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomePage()),
        GoRoute(
          path: '/second',
          builder: (context, state) => const SecondPage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider.value(
          value: authBloc,
          child: ValueListenableBuilder<ThemeMode>(
            valueListenable: themeNotifier,
            builder: (_, mode, __) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: ThemeData.light(),
                darkTheme: ThemeData.dark(),
                themeMode: mode,
                routerConfig: _router,
              );
            },
          ),
        );
      },
    );
  }
}

/// --------- 首页 ---------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用 SafeArea + LayoutBuilder 自适应小窗模式
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight.h),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SizedBox(
              height: constraints.minHeight.h,
              child: AppBar(
                centerTitle: true,
                primary: false,
                title: Text("Home Page", style: TextStyle(fontSize: 18.sp)),
                backgroundColor: Colors.pinkAccent,
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Window size:\n${1.toStringAsFixed(1)} x ${1.toStringAsFixed(1)}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, color: Colors.black),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/second'),
              child: const Text("Go to Second Page"),
            ),
          ],
        ),
      ),
    );
  }
}

/// --------- 第二页 ---------
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Second Page")),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final maxHeight = constraints.maxHeight;

            return Center(
              child: Container(
                width: maxWidth * 0.9,
                height: maxHeight * 0.3,
                color: Colors.green,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => GoRouter.of(context).pop(),
                    child: const Text("Back to Home"),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
