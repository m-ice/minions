// lib/features/auth/data/models/user_model.dart
import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.token,
  });

  /// JSON 转 Model
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"]?.toString() ?? "",
      username: json["username"] ?? "",
      email: json["email"] ?? "",
      token: json["token"] ?? "",
    );
  }

  /// Model 转 JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
      "token": token,
    };
  }
}
