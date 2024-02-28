// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class BottomNavigations extends StatelessWidget {
  const BottomNavigations({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      const BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined), label: 'Home'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: 'profile'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.money_rounded), label: 'payments'),
    ]);
  }
}
