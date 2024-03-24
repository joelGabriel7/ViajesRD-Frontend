// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigations extends StatelessWidget {
  final int currentPage;
  const BottomNavigations({super.key, required this.currentPage});

  void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/0');
        break;
      case 1:
        context.go('/home/1');
        break;
      case 2:
        context.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) => onItemTapped(context, index),
        items: const [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'profile'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.money_rounded), label: 'payments'),
        ]);
  }
}
