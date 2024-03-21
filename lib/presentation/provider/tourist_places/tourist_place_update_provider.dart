import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/infrastructure/repository/tourist_places_repository_impl.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_places_repository.dart';

final touristPlaceUpdateProvider =
    StateNotifierProvider.autoDispose<TouristPlaceUpdateNotifier, Map>((ref) {
  final placeUpdate = ref.watch(touristPlaceProvider);
  return TouristPlaceUpdateNotifier(placeUpdate);
});

class TouristPlaceUpdateNotifier
    extends StateNotifier<Map<String, TouristPlaces>> {
  final TouristPlacesRepositoryImpl respository;

  TouristPlaceUpdateNotifier(this.respository) : super({});

  Future<void> updateTouristPlace({
    required int id,
    required String name,
    required String description,
    required String location,
    required int categoryId,
    List<File>? images,
  }) async {
    try {
      final placeUpdate = await respository.updateTouristPlaces(
          id, name, description, location, categoryId);
      List<String> imageUrls = [];
      if (images != null && images.isNotEmpty) {
        imageUrls = await respository.uploadImages(id, images);
      }
      // Suponiendo que copyWith actualiza la lista de imágenes correctamente
      final updatedPlace = placeUpdate.copyWith(images: imageUrls);

      // Actualizar el estado para reflejar el lugar turístico actualizado
      state = {...state, id.toString(): updatedPlace};
      // Notificar a la UI que hay un cambio
      state = state;
    } catch (e) {
      rethrow;
    }
  }
}
