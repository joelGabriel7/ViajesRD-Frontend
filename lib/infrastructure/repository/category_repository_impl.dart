import 'package:viajes/domain/datasource/category_datasource.dart';
import 'package:viajes/domain/entity/category.dart';
import 'package:viajes/domain/repository/category_repository.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryDatasource datasource;
  CategoryRepositoryImpl(this.datasource);

  @override
  Future<List<Category>> getAllCategories({int page = 1}) {
    return datasource.getAllCategories(page: page);
  }
}
