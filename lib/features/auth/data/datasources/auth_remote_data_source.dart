import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String username, String password);

  Future<void> logout();
}

// import 'package:dio/dio.dart';
// import 'package:retrofit/http.dart';
//
// import '../models/user_model.dart';
//
// part 'auth_remote_data_source.g.dart';
//
// @RestApi(baseUrl: 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/')
// abstract class AuthRemoteDataSource {
//   factory AuthRemoteDataSource(Dio dio, {String? baseUrl}) =
//   _AuthRemoteDataSource;
//
//   @POST('/login')
//   @FormUrlEncoded()
//   Future<UserModel> login(
//       @Field('username') String username,
//       @Field('password') String password,
//       );
//
//   @POST('/logout')
//   Future<void> logout();
// }
