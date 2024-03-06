import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviromentes {
  static String apiUrl = dotenv.env['API_URL'] ?? '';
}
