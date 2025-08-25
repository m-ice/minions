import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user.dart';
import '../datasources/auth_remote_data_source.dart';

abstract class AuthRepository {
  Future<User> login(String username, String password);
  Future<void> logout();
  Future<bool> isLoggedIn();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<User> login(String username, String password) async {
    final userModel = await remote.login(username, password);
    // 保存 token
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', userModel.token);
    return User(
      id: userModel.id,
      username: userModel.username,
      email: userModel.email,
      token: userModel.token,
    );
  }

  @override
  Future<void> logout() async {
    // 清除 token
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  @override
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    return token != null && token.isNotEmpty;
  }
}
