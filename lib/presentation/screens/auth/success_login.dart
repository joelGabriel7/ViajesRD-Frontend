// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/constants/image_strings.dart';
import 'package:viajes/config/helpers/auth/decode_token.dart';
import 'package:viajes/presentation/views/auth/success_screen_view.dart';

class SuccessLoginScreen extends StatelessWidget {
  const SuccessLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessScreenView(
      images: TImages.staticSuccessILogin,
      title: '¡Inicio de Sesión Exitoso!',
      subtitle:
          '¡Felicidades! Has iniciado sesión con éxito. Estás a un paso de descubrir experiencias inolvidables.',
      onPressed: () async {
        // Aquí deberías obtener el rol del usuario
        final role = await TokenService.getRole();
        debugPrint('ROLE USER: $role');
        if (role == 'client') {
          context.push(
              '/home/client'); // Suponiendo que esta es la ruta para clientes
        } else if (role == 'agency') {
          context.push('/home'); // Suponiendo que esta es la ruta para agencias
        } else {
          // En caso de no reconocer el rol, puedes redirigir a una pantalla de error o a login
          context.push('/login');
        }
      },
    );
  }
}
