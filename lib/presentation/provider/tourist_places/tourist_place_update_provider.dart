import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/infrastructure/repository/tourist_places_repository_impl.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_places_repository.dart';

final touristPlaceUpdateProvider =
    StateNotifierProvider<TouristPlaceUpdateNotifier, Map>((ref) {
  final placeUpdate = ref.watch(touristPlaceProvider);
  return TouristPlaceUpdateNotifier(placeUpdate);
});

class TouristPlaceUpdateNotifier
    extends StateNotifier<Map<String, TouristPlaces>> {
  final TouristPlacesRepositoryImpl respository;

  TouristPlaceUpdateNotifier(this.respository) : super({});

  Future<TouristPlaces> updateTouristPlace(
      {required int id,
      required String name,
      required String description,
      required String location,
      required int categoryId,
      final List<File>? images}) async {
    try {
      TouristPlaces placeUpdate = await respository.updateTouristPlaces(
          id, name, description, location, categoryId);

      if (images != null && images.isNotEmpty) {
        // Lógica para subir imágenes
        final imageUrls = await respository.uploadImages(id, images);
        List<dynamic> updatedImages = [...placeUpdate.images, ...imageUrls];
        placeUpdate = placeUpdate.copyWith(images: updatedImages);
      }
      return placeUpdate;
    } catch (e) {
      rethrow;
    }
  }
}
