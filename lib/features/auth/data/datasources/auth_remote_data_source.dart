// lib/features/auth/data/datasources/auth_remote_data_source.dart
import 'package:dio/dio.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio; // 依赖注入 HTTP 客户端

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login(String username, String password) async {
    final response = await dio.post(
      "https://api.example.com/login",
      data: {
        "username": username,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception("登录失败: ${response.statusMessage}");
    }
  }

  @override
  Future<void> logout() async {
    final response = await dio.post("https://api.example.com/logout");
    if (response.statusCode != 200) {
      throw Exception("退出失败: ${response.statusMessage}");
    }
  }
}
