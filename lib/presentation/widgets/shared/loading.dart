import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimationScreen extends StatelessWidget {
  const LottieAnimationScreen({super.key, required this.lottie});
  final String lottie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200, // Define el ancho de la animación
          height: 200, // Define la altura de la animación
          child: Lottie.asset(lottie),
        ),
      ),
    );
  }
}
