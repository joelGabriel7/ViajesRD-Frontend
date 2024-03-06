import 'package:dio/dio.dart';
import 'package:viajes/domain/datasource/tourist_places_datasources.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/infrastructure/mappers/tourist_places_mapper.dart';
import 'package:viajes/infrastructure/models/tourist_place_details_models.dart';
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

  @override
  Future<TouristPlaces> getTouristPlacesById(int id) async {
    final response = await dio.get('/tourist_place/$id');

    if (response.statusCode != 200) {
      throw Exception('Lugar turistico con el  id:$id no encontrado');
    }

    final touristPlacesDetails =
        TouristPlacesResponsesDetails.fromJson(response.data);
    final TouristPlaces places =
        TouristPlacesMapper.touristPlacesToEntityDetail(touristPlacesDetails);

    return places;
  }
}
