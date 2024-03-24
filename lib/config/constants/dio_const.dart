import 'package:dio/dio.dart';
import 'package:viajes/config/helpers/auth/storage_token.dart';

Dio createDioInstance() {
  Dio dio = Dio(BaseOptions(baseUrl: 'https://apiviajesrd.info'));

  // Configuración de interceptor para añadir el token a cada petición
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      final SecureStorage secureStorage = SecureStorage();
      String? token = await secureStorage.getToken();
      if (token != null) {
        options.headers["Authorization"] = "Bearer $token";
      }
      return handler.next(options);
    },
  ));

  return dio;
}
