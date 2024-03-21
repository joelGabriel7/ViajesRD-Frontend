import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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
  void nextPage(BuildContext context) {
    if (currentPageIndex == 2) {
      context.push('/login');
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
}
