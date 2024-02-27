import '../entity/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAllCategories({int page = 1});
}
