// lib/features/auth/domain/usecases/login_use_case.dart

import '../../data/repositories/auth_repository.dart';
import '../entities/user.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> call(String username, String password) {
    return repository.login(username, password);
  }
}
