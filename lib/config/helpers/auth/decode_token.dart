import 'package:flutter/foundation.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:viajes/config/helpers/auth/storage_token.dart';

class TokenService {
  final SecureStorage secureStorage = SecureStorage();

  Future<bool> isTokenExpired() async {
    final token = await secureStorage.getToken();
    if (token == null) return true;

    try {
      final payload = Jwt.parseJwt(token);
      final exp = payload['exp'];
      if (exp is int || exp is double) {
        final expiryDate =
            DateTime.fromMillisecondsSinceEpoch((exp as num).toInt() * 1000);
        final isExpired = DateTime.now().isAfter(expiryDate);
        if (isExpired) {
          debugPrint('Token expired');
        } else {
          debugPrint('Token valid');
        }
        return isExpired;
      } else {
        debugPrint('Expiration time is missing or invalid in the token');
        return true; // Assume expired if 'exp' is missing or not a number
      }
    } catch (e) {
      debugPrint('Error checking token expiration: $e');
      return true; // Assume the token is expired if there's an error checking it
    }
  }

  Future<Map<String, dynamic>?> decodeToken() async {
    try {
      final token = await secureStorage.getToken();
      if (token != null && !(await isTokenExpired())) {
        final payload = Jwt.parseJwt(token);
        debugPrint('Username: ${payload['username']}');
        debugPrint('Role: ${payload['role']}');
        debugPrint('Agency ID: ${payload['agency_id']}');
        return payload;
      }
    } catch (e) {
      debugPrint("Error decoding token: $e");
    }
    return null;
  }

  static Future<String> getRole() async {
    final payload = await TokenService().decodeToken();
    return payload!['role'];
  }

  Future<int?> getAgencyId() async {
    final payload = await decodeToken();
    return payload!['agency_id'];
  }

  Future<int?> getClientId() async {
    final payload = await decodeToken();
    return payload!['client_id'];
  }
}
