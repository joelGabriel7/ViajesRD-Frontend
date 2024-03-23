// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/helpers/auth/storage_token.dart';

class RedirectWidget extends ConsumerWidget {
  const RedirectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Asumiendo que SecureStorage es accesible a través del provider o directamente
    final SecureStorage secureStorage = SecureStorage();

    Future.microtask(() async {
      final token = await secureStorage.getToken();
      if (token != null && token.isNotEmpty) {
        // Navega a la pantalla principal si el token existe
        context.go('/home');
      } else {
        // Navega a la pantalla de login si el token no existe
        context.go('/login');
      }
    });

    // Mientras se decide la ruta, muestra un indicador de carga o una pantalla vacía
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
