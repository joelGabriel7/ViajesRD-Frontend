import 'package:shared_preferences/shared_preferences.dart';

class UserProfileService {
  static const String _profileCompletedKey = 'profileCompleted';

  static Future<bool> isProfileCompleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_profileCompletedKey) ?? false;
  }

  static Future<void> markProfileAsCompleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_profileCompletedKey, true);
  }
}
