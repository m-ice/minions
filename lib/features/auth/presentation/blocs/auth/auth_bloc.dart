import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../data/repositories/auth_repository.dart';
import '../../../domain/useCases/login_use_case.dart';
import '../../../domain/useCases/logout_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  AuthBloc(this.loginUseCase, this.logoutUseCase) : super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_loggedIn);
    on<LoggedOut>(_loggedOut);
  }



  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2)); // 模拟检查 token
    // ⚠️ 这里写死为未登录，你可以换成真正的 isLoggedIn()
    emit(Unauthenticated());
  }

  Future<void> _loggedIn(LoggedIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2)); // 模拟检查 token
    final success = await loginUseCase(event.username, event.password);
    emit(success.token.isNotEmpty ? Authenticated() : Unauthenticated());
  }
  Future<void> _loggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    await logoutUseCase();
    emit(Unauthenticated());
  }


}
