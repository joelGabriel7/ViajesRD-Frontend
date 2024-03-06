import 'package:viajes/domain/entity/tourist_places.dart';

abstract class TouristPlacesRepository {
  Future<List<TouristPlaces>> getTouristPlaces({int page = 1});
  Future<TouristPlaces> getTouristPlacesById(int id);
}
