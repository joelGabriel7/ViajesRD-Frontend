import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:viajes/config/helpers/auth/storage_token.dart';
import 'package:viajes/domain/datasource/auth_services_datasources.dart';
import 'package:viajes/infrastructure/models/user_models.dart';

class AuthServicesApiDatasources extends AuthServicesDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://apiviajesrd.info'));
  final SecureStorage _secureStorage = SecureStorage();
  @override
  Future<bool> login(String username, String password) async {
    try {
      final formData = FormData.fromMap({
        'username': username,
        'password': password,
      });

      final responses = await dio.post('/auth/token', data: formData);

      debugPrint('Response status: ${responses.statusCode}');
      debugPrint('Response data: ${responses.data}');

      if (responses.statusCode == 200 &&
          responses.data != null is Map<String, dynamic>) {
        final authResponse = AuthReponses.fromJson(responses.data);
        await _secureStorage.saveToken(authResponse.accessToken);
        debugPrint('Login success');
        return true;
      }
      debugPrint('Login failed');
      return false;
    } on DioException catch (e) {
      final errorMessage = e.response?.data['detail'] ?? 'Error desconocido';
      throw Exception(errorMessage);
    }
  }
}
