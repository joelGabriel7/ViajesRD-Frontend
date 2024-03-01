import 'package:dio/dio.dart';
import 'package:viajes/domain/datasource/category_datasource.dart';
import 'package:viajes/domain/entity/category.dart';
import 'package:viajes/infrastructure/mappers/category_mapper.dart';

import '../models/category_models.dart';

class CategoryApiDatasource extends CategoryDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://api-viajesrd.onrender.com'));

  @override
  Future<List<Category>> getAllCategories({int page = 1}) async {
    final response = await dio.get('/category/list');
    List<dynamic> categoryResponse = response.data;

    final List<Category> categories = categoryResponse
        .map((results) =>
            CategoryMapper.categoryToEntity(CategoryResponse.fromJson(results)))
        .toList();
    return categories;
  }
}
