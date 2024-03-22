import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/presentation/views/auth/onboarding_view.dart';
import 'package:viajes/utils/constants/sizes.dart';
import 'package:viajes/utils/device/device_utility.dart';

class OnBoardingDotNavigations extends StatelessWidget {
  const OnBoardingDotNavigations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnboardingView.instance;
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: controller.dotNavigationClick,
        effect: const ExpandingDotsEffect(
            activeDotColor: TColors.primary, dotHeight: 6),
      ),
    );
  }
}
