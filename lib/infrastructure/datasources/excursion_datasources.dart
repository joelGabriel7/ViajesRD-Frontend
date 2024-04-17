import 'package:dio/dio.dart';
import 'package:viajes/config/constants/dio_const.dart';
import 'package:viajes/domain/datasource/excursions.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/infrastructure/mappers/excursions_mapper.dart';
import 'package:viajes/infrastructure/models/excursions_models.dart';

class ExcursionApiDatasources extends ExcursionDatasources {
  final Dio dio = createDioInstance();
  @override
  Future<List<Excursion>> getExcursions({int page = 1}) async {
    final response = await dio.get('/excursions/list');
    List<dynamic> excursionResponses = response.data;
    final List<Excursion> excursion = excursionResponses
        .map((results) => ExcursionMapper.excursionToEntity(
            ExcursionsResponses.fromJson(results)))
        .toList();
    return excursion;
  }

  @override
  Future<void> createExcursion(Excursion excursion) {
    // TODO: implement createExcursion
    throw UnimplementedError();
  }

  @override
  Future<void> deleteExcursion(String id) {
    // TODO: implement deleteExcursion
    throw UnimplementedError();
  }

  @override
  Future<Excursion> getExcursion(String id) {
    // TODO: implement getExcursion
    throw UnimplementedError();
  }

  @override
  Future<void> updateExcursion(Excursion excursion) {
    // TODO: implement updateExcursion
    throw UnimplementedError();
  }
}
