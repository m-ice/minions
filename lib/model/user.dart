// import 'package:dio/dio.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:retrofit/http.dart';
//
// part 'user.g.dart'; // 生成的文件
//
// @JsonSerializable()
// class User {
//   final int id;
//   final String name;
//   final String? email; // 可选字段
//
//   User({required this.id, required this.name, this.email});
//
//   // 从 JSON 转为对象
//   factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
//
//   // 从对象 转为 JSON
//   Map<String, dynamic> toJson() => _$UserToJson(this);
// }
//
// @RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
// abstract class RestClient {
//   factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;
//
//   /// GET 请求带查询参数
//   @GET('/tasks')
//   Future<List<User>> getTasks(
//     @Query('page') int page,
//     @Query('limit') int limit,
//   );
//
//   /// POST 请求示例
//   @POST('/tasks')
//   Future<User> createTask(@Body() User user);
//
//   /// GET 请求带路径参数
//   @GET('/tasks/{id}')
//   Future<User> getTaskById(@Path('id') String id);
// }
