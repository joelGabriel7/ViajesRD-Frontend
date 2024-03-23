import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/constants/image_strings.dart';
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
        onPressed: () => context.push('/home'));
  }
}
