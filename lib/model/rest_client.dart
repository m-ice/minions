import 'package:dio/dio.dart';
import 'package:minions/model/user2.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  /// GET 请求带查询参数
  @GET('/tasks')
  Future<List<User2>> getTasks(
    @Query('page') int page,
    @Query('limit') int limit,
  );

  /// POST 请求示例
  @POST('/tasks')
  Future<User2> createTask(@Body() User2 user);

  /// GET 请求带路径参数
  @GET('/tasks/{id}')
  Future<User2> getTaskById(@Path('id') String id);
}
