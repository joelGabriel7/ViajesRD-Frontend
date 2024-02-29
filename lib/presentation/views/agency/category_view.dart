import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/providers.dart';

import '../../provider/loader.dart';
import '../../widgets/custom_listview.dart';

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
