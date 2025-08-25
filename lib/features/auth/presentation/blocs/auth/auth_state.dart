part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}
class Authenticated extends AuthState {}
class Unauthenticated extends AuthState {}

/// 登录、退出等操作进行中
class AuthLoading extends AuthState {}