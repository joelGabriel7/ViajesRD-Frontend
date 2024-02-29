import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/categories/categories_repository_provider.dart';

import '../../../domain/entity/category.dart';

final getAllCategoryProvider =
    StateNotifierProvider<CategoryNotifier, List<Category>>((ref) {
  final fetchMoreCategory =
      ref.watch(categoryRepositoryProvider).getAllCategories;

  return CategoryNotifier(fetchMoreCategory: fetchMoreCategory);
});

typedef CategoryCallback = Future<List<Category>> Function({int page});

class CategoryNotifier extends StateNotifier<List<Category>> {
  int currentPage = 0;
  bool isLoading = false;
  CategoryCallback fetchMoreCategory;

  CategoryNotifier({required this.fetchMoreCategory}) : super([]);

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;

    final List<Category> category = await fetchMoreCategory(page: currentPage);
    state = category;
    // state = [...state, ...category];

    await Future.delayed(const Duration(milliseconds: 3000));
    isLoading = false;
  }
}
