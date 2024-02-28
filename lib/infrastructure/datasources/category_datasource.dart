import 'package:dio/dio.dart';
import 'package:viajes/domain/datasource/category_datasource.dart';
import 'package:viajes/domain/entity/category.dart';

class CategoryApiDatasource extends CategoryDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'http://127.0.0.1:8000/'));

  @override
  Future<List<Category>> getAllCategories({int page = 1}) async {
    final response = await dio.get('/category/list');
    return response.data;
  }
}
