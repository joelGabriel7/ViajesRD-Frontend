import 'dart:io';
import 'package:dio/dio.dart';
import 'package:viajes/config/constants/dio_const.dart';
import 'package:viajes/domain/datasource/tourist_places_datasources.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/infrastructure/mappers/tourist_places_mapper.dart';
import 'package:viajes/infrastructure/models/tourist_place_details_models.dart';
import 'package:viajes/infrastructure/models/tourist_places_models.dart';

class TouristPlacesApiDatasources extends TouristPlacesDatasources {
  final Dio dio = createDioInstance();

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

  @override
  Future<TouristPlaces> addTouristPlaces(
      String name, String description, String location, int categoryId) async {
    try {
      final response = await dio.post('/tourist_place/create', data: {
        'name': name,
        'description': description,
        'location': location,
        'category_id': categoryId,
      });
      if (response.data != null && response.data is Map<String, dynamic>) {
        final responses = TouristPlacesResponses.fromJson(response.data);
        final entity = TouristPlacesMapper.touristPlacesToEntity(responses);
        return entity;
      } else {
        throw Exception('Failed to load tourist places');
      }
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<String>> uploadImages(
      int touristPlaceId, List<File> images) async {
    var formData = FormData();

    for (var image in images) {
      String fileName = image.path.split('/').last;
      formData.files.add(MapEntry(
        "files",
        await MultipartFile.fromFile(image.path, filename: fileName),
      ));
    }

    try {
      Options options = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      final response = await dio.post('/tourist_place/$touristPlaceId/images/',
          data: formData, options: options);

      if (response.statusCode == 200 && response.data is Map) {
        List<String> imageUrls = List<String>.from(response.data['images']
            .map((image) => image['image_url'].toString()));
        return imageUrls;
      } else {
        throw Exception('Unexpected server response');
      }
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<TouristPlaces> updateTouristPlaces(int id, String name,
      String description, String location, int categoryId) async {
    final response = await dio.put('/tourist_place/update/$id', data: {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'category_id': categoryId,
    });
    if (response.data != null && response.data is Map<String, dynamic>) {
      final responses = TouristPlacesResponses.fromJson(response.data);
      final entity = TouristPlacesMapper.touristPlacesToEntity(responses);
      return entity;
    } else {
      throw Exception('Failed to load tourist places');
    }
  }

  @override
  Future<TouristPlaces> deleteTouristPlacesById(int id) async {
    final response = await dio.delete('/tourist_place/delete/$id');

    if (response.statusCode != 200) {
      throw Exception('Lugar turistico con el  id:$id no encontrado');
    }

    final touristPlaces = TouristPlacesResponses.fromJson(response.data);
    final entity = TouristPlacesMapper.touristPlacesToEntity(touristPlaces);
    return entity;
  }

  @override
  Future<List<TouristPlaces>> searchTouristPlaces(String query) async {
    if (query.isEmpty) return [];
    final response = await dio
        .get('/tourist_place/search/', queryParameters: {'search': query});

    List<dynamic> touristResponses = response.data;
    final List<TouristPlaces> touristPlace = touristResponses
        .map((results) => TouristPlacesMapper.touristPlacesToEntity(
            TouristPlacesResponses.fromJson(results)))
        .toList();

    return touristPlace;
  }
}
