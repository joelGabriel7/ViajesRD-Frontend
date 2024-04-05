import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/users/auth/token_services_auth.dart';
import 'package:viajes/presentation/widgets/shared/loading.dart';

class RedirectWidget extends ConsumerWidget {
  const RedirectWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.read(tokenStateProvider.notifier).init();

    return const Scaffold(
      body: Center(
          child: LottieAnimationScreen(
              lottie: 'assets/images/animations/141397-loading-juggle.json')
          // Lottie.asset('assets/images/animations/141397-loading-juggle.json'),
          ),
    );
  }
}
