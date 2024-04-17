import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/infrastructure/datasources/excursion_datasources.dart';
import 'package:viajes/infrastructure/repository/excursions_repository_impl.dart';

final excursionsRepositoryProvider = Provider((ref) {
  return ExcursionsRepositoryImpl(ExcursionApiDatasources());
});
