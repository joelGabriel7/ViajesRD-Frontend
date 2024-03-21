import 'dart:io';

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

  @override
  Future<TouristPlaces> addTouristPlaces(
      String name, String description, String location, int categoryId) {
    return datasource.addTouristPlaces(name, description, location, categoryId);
  }

  @override
  Future<List<String>> uploadImages(int touristPlaceId, List<File> images) {
    return datasource.uploadImages(touristPlaceId, images);
  }

  @override
  Future<TouristPlaces> updateTouristPlaces(int id, String name,
      String description, String location, int categoryId) {
    return datasource.updateTouristPlaces(
        id, name, description, location, categoryId);
  }

  @override
  Future<TouristPlaces> deleteTouristPlacesById(int id) {
    return datasource.deleteTouristPlacesById(id);
  }
}
