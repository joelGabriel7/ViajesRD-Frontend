import 'dart:io';

import 'package:viajes/domain/entity/tourist_places.dart';

abstract class TouristPlacesRepository {
  Future<List<TouristPlaces>> getTouristPlaces({int page = 1});
  Future<TouristPlaces> getTouristPlacesById(int id);
  Future<TouristPlaces> deleteTouristPlacesById(int id);
  Future<TouristPlaces> addTouristPlaces(
      String name, String description, String location, int categoryId);
  Future<TouristPlaces> updateTouristPlaces(
      int id, String name, String description, String location, int categoryId);
  Future<List<String>> uploadImages(int touristPlaceId, List<File> images);
}
