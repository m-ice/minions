import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/app.dart';
import 'app/app_bloc_observer.dart';
import 'app/di.dart';
import 'features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'injection.dart' hide getIt;

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  setupDI();
  Bloc.observer = AppBlocObserver(); // 全局绑定
  final AuthBloc authBloc=getIt();
  authBloc.add(AppStarted()); // ✅ 启动时触发检查
  runApp(App(authBloc: authBloc,));
}

// import 'dart:collection';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// /// =======================
// /// 1. DialogService（支持队列）
// /// =======================
// class DialogService {
//   static final DialogService _instance = DialogService._internal();
//   factory DialogService() => _instance;
//   DialogService._internal();
//
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//
//   final Queue<Future Function()> _dialogQueue = Queue();
//   bool _isShowing = false;
//
//   void enqueueDialog(Future Function() dialogTask) {
//     _dialogQueue.add(dialogTask);
//     _tryShowNext();
//   }
//
//   void _tryShowNext() {
//     if (_isShowing || _dialogQueue.isEmpty) return;
//
//     final task = _dialogQueue.removeFirst();
//     _isShowing = true;
//     task().whenComplete(() {
//       _isShowing = false;
//       _tryShowNext();
//     });
//   }
//
//   void showAppDialog(Widget dialog) {
//     enqueueDialog(() async {
//       return showDialog(
//         context: navigatorKey.currentContext!,
//         barrierDismissible: false,
//         builder: (_) => dialog,
//       );
//     });
//   }
//
//   void showBottomSheet(Widget sheet) {
//     enqueueDialog(() async {
//       return showModalBottomSheet(
//         context: navigatorKey.currentContext!,
//         builder: (_) => sheet,
//       );
//     });
//   }
//
//   void showSnackBar(String message) {
//     ScaffoldMessenger.of(navigatorKey.currentContext!)
//         .showSnackBar(SnackBar(content: Text(message)));
//   }
// }
//
// /// =======================
// /// 2. 统一样式 AppDialog
// /// =======================
// class AppDialog extends StatelessWidget {
//   final String title;
//   final String message;
//   final String confirmText;
//   final String? cancelText;
//   final VoidCallback onConfirm;
//   final VoidCallback? onCancel;
//
//   const AppDialog({
//     super.key,
//     required this.title,
//     required this.message,
//     required this.confirmText,
//     this.cancelText,
//     required this.onConfirm,
//     this.onCancel,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//       content: Text(message),
//       actions: [
//         if (cancelText != null)
//           TextButton(
//             onPressed: onCancel ?? () => Navigator.pop(context),
//             child: Text(cancelText!),
//           ),
//         ElevatedButton(
//           onPressed: onConfirm,
//           child: Text(confirmText),
//         ),
//       ],
//     );
//   }
// }
//
// /// =======================
// /// 3. Bloc 定义
// /// =======================
// sealed class LoginEvent {}
// class LoginSubmitted extends LoginEvent {
//   final String username;
//   final String password;
//   LoginSubmitted(this.username, this.password);
// }
//
// sealed class LoginState {}
// class LoginInitial extends LoginState {}
// class LoginLoading extends LoginState {}
// class LoginSuccess extends LoginState {}
// class LoginFailure extends LoginState {
//   final String error;
//   LoginFailure(this.error);
// }
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginInitial()) {
//     on<LoginSubmitted>(_onLoginSubmitted);
//   }
//
//   Future<void> _onLoginSubmitted(
//       LoginSubmitted event, Emitter<LoginState> emit) async {
//     emit(LoginLoading());
//     await Future.delayed(const Duration(milliseconds: 800));
//
//     if (event.username == "admin" && event.password == "1234") {
//       emit(LoginSuccess());
//     } else {
//       emit(LoginFailure("用户名或密码错误（${DateTime.now().second} 秒）"));
//     }
//   }
// }
//
// /// =======================
// /// 4. LoginPage（使用 Bloc + DialogService）
// /// =======================
// class LoginPage extends StatelessWidget {
//   final _usernameController = TextEditingController();
//   final _passwordController = TextEditingController();
//
//   LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => LoginBloc(),
//       child: BlocConsumer<LoginBloc, LoginState>(
//         listener: (context, state) {
//           if (state is LoginLoading) {
//             DialogService().showAppDialog(
//               const Center(child: CircularProgressIndicator()),
//             );
//           } else {
//             // 确保 loading 被关闭（如果存在的话）
//             if (DialogService().navigatorKey.currentContext != null) {
//               Navigator.of(
//                 DialogService().navigatorKey.currentContext!,
//                 rootNavigator: true,
//               ).pop();
//             }
//
//             if (state is LoginSuccess) {
//               DialogService().showAppDialog(
//                 AppDialog(
//                   title: "登录成功",
//                   message: "欢迎回来！",
//                   confirmText: "确定",
//                   onConfirm: () => Navigator.pop(context),
//                 ),
//               );
//             }
//
//             if (state is LoginFailure) {
//               DialogService().showAppDialog(
//                 AppDialog(
//                   title: "错误",
//                   message: state.error,
//                   confirmText: "重试",
//                   onConfirm: () =>
//                       Navigator.pop(DialogService().navigatorKey.currentContext!),
//                 ),
//               );
//             }
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             appBar: AppBar(title: const Text("登录 Demo")),
//             body: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   TextField(
//                     controller: _usernameController,
//                     decoration: const InputDecoration(labelText: "用户名"),
//                   ),
//                   TextField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     decoration: const InputDecoration(labelText: "密码"),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       context.read<LoginBloc>().add(
//                         LoginSubmitted(
//                           _usernameController.text,
//                           _passwordController.text,
//                         ),
//                       );
//                     },
//                     child: const Text("登录"),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// /// =======================
// /// 5. main2.dart 入口
// /// =======================
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: DialogService().navigatorKey,
//       home: LoginPage(),
//     );
//   }
// }
