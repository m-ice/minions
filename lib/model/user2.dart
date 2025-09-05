import 'package:json_annotation/json_annotation.dart';

part 'user2.g.dart'; // 生成的文件

@JsonSerializable()
class User2 {
  final int id;
  final String name;
  final String? email; // 可选字段

  User2({
    required this.id,
    required this.name,
    this.email,
  });

  // 从 JSON 转为对象
  factory User2.fromJson(Map<String, dynamic> json) => _$User2FromJson(json);

  // 从对象 转为 JSON
  Map<String, dynamic> toJson() => _$User2ToJson(this);
}
