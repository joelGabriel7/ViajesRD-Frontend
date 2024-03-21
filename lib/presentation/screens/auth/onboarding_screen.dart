import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/constants/image_strings.dart';
import 'package:viajes/config/constants/text_strings.dart';
import 'package:viajes/presentation/views/auth/onboarding_view.dart';
import 'package:viajes/presentation/widgets/auth/onboarding_dot_navigation.dart';
import 'package:viajes/presentation/widgets/auth/onboarding_page.dart';
import 'package:viajes/presentation/widgets/auth/onboarding_skip.dart';
import 'package:viajes/utils/constants/sizes.dart';
import 'package:viajes/utils/device/device_utility.dart';
import 'package:viajes/utils/helpers/helper_functions.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingView());
    return Scaffold(
      body: Stack(
        children: [
          //* Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardinPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardinPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardinPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          //* SkipButton
          const OnBoardingSkip(),
          //* Dot navigation SmoothPageIndicator
          const OnBoardingDotNavigations(),
          //* Buttom
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      right: TSizes.defaultSpace,
      child: SizedBox(
        height: 50, // Cambia a tu valor deseado
        width: 50, // Cambia a tu valor deseado
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: dark ? TColors.primary : TColors.dark,
            padding:
                const EdgeInsets.all(0), // Asegúrate de que el padding sea 0
          ),
          onPressed: () => OnboardingView.instance.nextPage(context),
          child: const Icon(
            Iconsax.arrow_right_3,
            // size: 30,
          ),
        ),
      ),
    );
  }
}
