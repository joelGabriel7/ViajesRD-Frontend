import 'package:viajes/domain/entity/category.dart';
import 'package:viajes/infrastructure/models/category_models.dart';

class CategoryMapper {
  static Category categoryToEntity(CategoryResponse category) => Category(
      id: category.id,
      name: category.name,
      description: category.description!,
      codeCategory: category.codeCategory);
}
