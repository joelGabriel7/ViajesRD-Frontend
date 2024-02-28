import 'package:flutter/material.dart';
import 'package:viajes/presentation/views/agency/category_view.dart';

class CategoryScreen extends StatelessWidget {
  static const name = 'category-name';
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category Screen'),
        centerTitle: true,
      ),
      body: const CategoryView(),
    );
  }
}
