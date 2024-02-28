import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/infrastructure/datasources/category_datasource.dart';
import 'package:viajes/infrastructure/repository/category_repository_impl.dart';

final categoryRepositoryProvider = Provider((ref) {
  return CategoryRepositoryImpl(CategoryApiDatasource());
});
