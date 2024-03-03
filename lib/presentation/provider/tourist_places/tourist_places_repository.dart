import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/infrastructure/datasources/tourist_places_datasources.dart';
import 'package:viajes/infrastructure/repository/tourist_places_repository_impl.dart';

final touristPlaceProvider = Provider((ref) {
  return TouristPlacesRepositoryImpl(TouristPlacesApiDatasources());
});
