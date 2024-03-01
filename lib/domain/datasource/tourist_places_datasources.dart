import 'package:viajes/domain/entity/tourist_places.dart';

abstract class TouristPlacesDatasources {
  Future<List<TouristPlaces>> getTouristPlaces({int page = 1});
}
