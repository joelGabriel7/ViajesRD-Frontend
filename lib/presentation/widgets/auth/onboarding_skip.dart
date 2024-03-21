import 'package:flutter/material.dart';
import 'package:viajes/presentation/views/auth/onboarding_view.dart';
import 'package:viajes/utils/constants/sizes.dart';
import 'package:viajes/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnboardingView.instance.skipPage(),
          child: const Text('Saltar'),
        ));
  }
}
