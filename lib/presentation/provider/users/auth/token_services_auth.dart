import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viajes/config/constants/enums.dart';
import 'package:viajes/config/helpers/auth/decode_token.dart';
import 'package:viajes/config/router/provider/go_router_provider.dart';

final tokenStateProvider =
    StateNotifierProvider<TokenStateNotifier, bool>((ref) {
  return TokenStateNotifier(ref); // Pass the Reader directly
});

class TokenStateNotifier extends StateNotifier<bool> {
  TokenStateNotifier(this.ref) : super(false); // Initially not expired

  final Ref ref; // Receive Reader as a dependency

  void init() async {
    await Future.delayed(const Duration(seconds: 3));
    final isTokenExpired = await checkTokenExpiration();
    state = isTokenExpired;
  }

  Future<bool> checkTokenExpiration() async {
    final tokenService = TokenService();
    final isExpired = await tokenService.isTokenExpired();
    if (isExpired) {
      ref.read(goRouterProvider).push('/login'); // Redirect to login page
      await SharedPreferences.getInstance().then((prefs) => prefs.clear());
    } else {
      final userRoleString = await TokenService.getRole();
      final userRole = UserRole.values.byName(userRoleString);
      switch (userRole) {
        case UserRole.agency:
          ref.read(goRouterProvider).push('/home/0');
          break;
        case UserRole.client:
          ref.read(goRouterProvider).push('/home/client');
          break;
        default:
          ref.read(goRouterProvider).push('/login');
      }
    }
    return isExpired;
  }

  void startPeriodicCheck() {
    Timer.periodic(const Duration(minutes: 5), (timer) async {
      final isExpired = await checkTokenExpiration();
      state = isExpired; // Update StateNotifier state
    });
  }
}
