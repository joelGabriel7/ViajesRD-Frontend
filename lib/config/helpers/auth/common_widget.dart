import 'package:flutter/material.dart';
import 'package:viajes/presentation/widgets/shared/loading.dart';

class RedirectWidget extends StatelessWidget {
  const RedirectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: LottieAnimationScreen(
              lottie: 'assets/images/animations/141397-loading-juggle.json')
          // Lottie.asset('assets/images/animations/141397-loading-juggle.json'),
          ),
    );
  }
}
