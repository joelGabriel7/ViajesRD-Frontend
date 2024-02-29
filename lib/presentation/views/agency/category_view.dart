import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:viajes/domain/entity/category.dart';
import 'package:viajes/presentation/provider/providers.dart';

import '../../provider/loader.dart';

class CategoryView extends ConsumerStatefulWidget {
  const CategoryView({super.key});

  @override
  CategoryViewState createState() => CategoryViewState();
}

class CategoryViewState extends ConsumerState<CategoryView> {
  bool loaded = false;

  @override
  void initState() {
    super.initState();

    if (!loaded) {
      loaded = true;
      ref.read(getAllCategoryProvider.notifier).loadNextPage();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initlLoadingProvider);
    if (initialLoading) {
      return const Center(
          child: CircularProgressIndicator(
        strokeWidth: 5,
      ));
    }
    final categories = ref.watch(getAllCategoryProvider);
    return CustomList(item: categories);
  }
}

class CustomList extends StatelessWidget {
  const CustomList({
    super.key,
    required this.item,
  });

  final List item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listado de categorias')),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: item.length,
        itemBuilder: (context, index) {
          final category = item[index];
          if (item.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(5.0),
                title: Text(category.name),
                subtitle: Text(category.description),
              ),
            );
          }
          return const Center(child: Text("No hay categorias"));
        },
      ),
    );
  }
}
