import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/helpers/auth/storage_token.dart';

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
    final SecureStorage secureStorage = SecureStorage();
    final token = await secureStorage.getToken();

    if (!onboardingCompleted) {
      // Si el onboarding no se ha completado, redirige a la pantalla de onboarding
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/onboarding');
      });
    } else if (token != null && token.isNotEmpty) {
      // Si el onboarding está completado y hay un token, redirige a la pantalla de inicio
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.push('/home');
      });
    } else {
      // Si el onboarding está completado pero no hay un token, redirige a la pantalla de login
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.push('/login');
      });
    }
  }
}
