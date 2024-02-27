import '../entity/category.dart';

abstract class CategoryDatasource {
  Future<List<Category>> getAllCategories({int page = 1});
}
