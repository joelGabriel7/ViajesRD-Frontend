import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/constants/image_strings.dart';
import 'package:viajes/presentation/views/auth/success_screen_view.dart';

class SuccesAgencyProfile extends StatelessWidget {
  const SuccesAgencyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessScreenView(
        images: TImages.staticSuccessILogin,
        title: 'Tu agencia ha sido registrado exitosamente',
        subtitle: '¡Felicidades! Has registrado tu agencia con éxito.',
        onPressed: () => context.go('/home/0'));
  }
}
