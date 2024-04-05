// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingView extends GetxController {
  static OnboardingView get instance => Get.find();

  //* Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //* Scroll on pages
  void updatePageIndicator(index) => currentPageIndex.value = index;
  //* Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //* update current index & jump to next page
  void nextPage(BuildContext context) async {
    if (currentPageIndex == 2) {
      await completeOnboarding();
      context.go('/login');
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //* update current index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  Future<void> completeOnboarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
  }
}
