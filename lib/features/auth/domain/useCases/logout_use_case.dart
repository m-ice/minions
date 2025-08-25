import '../../data/repositories/auth_repository.dart';

/// 退出登录用例
class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  Future<void> call() {
    return repository.logout();
  }
}