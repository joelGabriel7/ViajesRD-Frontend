import 'package:dio/dio.dart';
import 'package:viajes/domain/datasource/tourist_places_datasources.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/infrastructure/mappers/tourist_places_mapper.dart';
import 'package:viajes/infrastructure/models/tourist_places_models.dart';

class TouristPlacesApiDatasources extends TouristPlacesDatasources {
  final dio = Dio(BaseOptions(baseUrl: 'https://apiviajesrd.info'));
  @override
  Future<List<TouristPlaces>> getTouristPlaces({int page = 1}) async {
    final response = await dio.get('/tourist_place/list');

    List<dynamic> touristResponses = response.data;
    final List<TouristPlaces> touristPlace = touristResponses
        .map((results) => TouristPlacesMapper.touristPlacesToEntity(
            TouristPlacesResponses.fromJson(results)))
        .toList();

    return touristPlace;
  }
}
