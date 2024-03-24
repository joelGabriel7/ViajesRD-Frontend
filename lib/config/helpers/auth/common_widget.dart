import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/helpers/auth/decode_token.dart';

class RedirectWidget extends StatelessWidget {
  const RedirectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    checkInitialRoute(context);
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> checkInitialRoute(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final onboardingCompleted = prefs.getBool('onboardingCompleted') ?? false;
    final tokenService = TokenService();

    if (!onboardingCompleted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/onboarding');
      });
      return;
    }

    final isTokenExpired = await tokenService.isTokenExpired();
    if (isTokenExpired) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
      return;
    }

    // Obtén el rol del usuario a partir del token decodificado
    final role = await TokenService.getRole();
    if (role == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
      return;
    }

    // Redirigir al usuario según su rol
    final route = role == 'agency' ? '/home' : '/home/client';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.push(route);
    });
  }
}
