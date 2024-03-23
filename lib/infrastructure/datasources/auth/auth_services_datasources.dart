import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:viajes/config/helpers/auth/storage_token.dart';
import 'package:viajes/domain/datasource/auth_services_datasources.dart';

class AuthServicesApiDatasources extends AuthServicesDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://apiviajesrd.info'));
  final SecureStorage _secureStorage = SecureStorage();
  @override
  Future<bool> login(String username, String password) async {
    try {
      final responses = await dio.post('/auth/token', data: {
        'username': username,
        'password': password,
      });

      if (responses.statusCode == 200) {
        await _secureStorage.saveToken(responses.data['access_token']);
        return true;
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
