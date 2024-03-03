import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  final String category;
  final int index;
  final TabController tabController; // Añadir esto

  const TabBarWidget({
    super.key,
    required this.category,
    required this.index,
    required this.tabController, // Añadir esto
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = tabController.index == index;
    return Opacity(
      opacity: isSelected ? 1 : 0.5,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 4),
        elevation: isSelected ? 1 : 0,
        // color: _backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            category,
            style: const TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
