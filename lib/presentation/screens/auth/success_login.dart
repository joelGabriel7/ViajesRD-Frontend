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
        if (role == 'client') {
          context.push('/home/client');
        } else if (role == 'agency') {
          context.push('/home/0');
        } else {
          context.push('/login');
        }
      },
    );
  }
}
