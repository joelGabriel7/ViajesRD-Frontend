import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/providers.dart';

class CategoryView extends ConsumerStatefulWidget {
  const CategoryView({super.key});

  @override
  CategoryViewState createState() => CategoryViewState();
}

class CategoryViewState extends ConsumerState<CategoryView> {
  @override
  void initState() {
    super.initState();
    ref.read(getAllCategoryProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(getAllCategoryProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          if (categories.isNotEmpty) {
            return ListTile(
              title: Text(category.name),
              subtitle: Text(category.description),
            );
          }
          return const Text("No hay categorias");
        },
      ),
    );
  }
}
