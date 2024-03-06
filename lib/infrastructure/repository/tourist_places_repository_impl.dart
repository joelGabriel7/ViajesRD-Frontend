import 'package:viajes/domain/datasource/tourist_places_datasources.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/domain/repository/tourist_places_repository.dart';

class TouristPlacesRepositoryImpl extends TouristPlacesRepository {
  final TouristPlacesDatasources datasource;
  TouristPlacesRepositoryImpl(this.datasource);

  @override
  Future<List<TouristPlaces>> getTouristPlaces({int page = 1}) {
    return datasource.getTouristPlaces(page: page);
  }

  @override
  Future<TouristPlaces> getTouristPlacesById(int id) {
    return datasource.getTouristPlacesById(id);
  }
}
