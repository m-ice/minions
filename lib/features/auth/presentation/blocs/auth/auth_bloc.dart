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
    on<LoggedIn>((event, emit) async {
      emit(AuthLoading());
      final success = await loginUseCase(event.username, event.password);
      emit(success.token.isNotEmpty ? Authenticated() : Unauthenticated());
    });

    on<LoggedOut>((event, emit) async {
      await logoutUseCase();
      emit(Unauthenticated());
    });
  }
}
