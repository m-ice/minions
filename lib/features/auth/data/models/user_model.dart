import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.token,
  });

  // 从 JSON 转为对象
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // 从对象 转为 JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
