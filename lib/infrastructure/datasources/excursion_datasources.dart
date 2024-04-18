import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
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
  Future<Excursion> getExcursion(String id) async {
    final response = await dio.get('/excursions/list/$id');
    if (response.statusCode != 200) {
      throw Exception('Excursion con el id: $id no found');
    }
    final excursionDetails = ExcursionsResponses.fromJson(response.data);
    final Excursion excursion =
        ExcursionMapper.excursionToEntity(excursionDetails);
    return excursion;
  }

  @override
  Future<void> createExcursion(Excursion excursion) async {
    final response = await dio.post('/excursions/create', data: {
      'agency_id': excursion.agencyId,
      'tourist_place_id': excursion.touristPlaceId,
      'date_excursion': excursion.dateExcursion.toIso8601String(),
      'duration_excursion': excursion.durationExcursion,
      'price': excursion.price,
      'description': excursion.description,
      'available_places': excursion.availablePlaces,
    });

    if (response.statusCode != 201) {
      throw Exception('Error al crear la excursión');
    } else {
      final excursion = ExcursionsResponses.fromJson(response.data);
      final entity = ExcursionMapper.excursionToEntity(excursion);
      debugPrint('Excursión creada con éxito: $entity');
    }
  }

  @override
  Future<void> deleteExcursion(String id) {
    // TODO: implement deleteExcursion
    throw UnimplementedError();
  }

  @override
  Future<void> updateExcursion(Excursion excursion) {
    // TODO: implement updateExcursion
    throw UnimplementedError();
  }
}
