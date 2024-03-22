import 'package:dio/dio.dart';
import 'package:viajes/domain/datasource/user_datasource.dart';
import 'package:viajes/domain/entity/user.dart';
import 'package:viajes/infrastructure/mappers/user_mapper.dart';
import 'package:viajes/infrastructure/models/user_models.dart';

class UserApiDatasources extends UserDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://apiviajesrd.info'));

  @override
  Future<UserEntity> createUser(
      String username, String email, String password, String role) async {
    final response = await dio.post('/users/create', data: {
      'username': username,
      'email': email,
      'password': password,
      'role': role
    });
    if (response.data != null && response.data is Map<String, dynamic>) {
      print(response.data);
      final reponses = UserResponses.fromJson(response.data);
      final entity = UserMapper.userToEntity(reponses);
      return entity;
    } else {
      throw Exception('Failed to load user');
    }
  }
}
