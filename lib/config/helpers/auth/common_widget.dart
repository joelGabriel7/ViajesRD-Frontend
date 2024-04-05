import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viajes/presentation/provider/users/auth/token_services_auth.dart';
import 'package:viajes/presentation/widgets/shared/loading.dart';

class RedirectWidget extends ConsumerWidget {
  const RedirectWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    _checkOnboardingComplete().then((complete) {
      if (complete) {
        ref.read(tokenStateProvider.notifier).init();
      } else {
        context.go('/onboarding');
      }
    });

    return const Scaffold(
      body: Center(
          child: LottieAnimationScreen(
              lottie: 'assets/images/animations/141397-loading-juggle.json')),
    );
  }

  Future<bool> _checkOnboardingComplete() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboardingCompleted') ?? false;
  }
}
