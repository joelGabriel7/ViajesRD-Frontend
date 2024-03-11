import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/domain/repository/tourist_places_repository.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_places_repository.dart';

enum AddTouristPlaceStatus { initial, loading, success, error }

class AddTouristPlaceState {
  final AddTouristPlaceStatus status;
  final String? errorMessage;
  final TouristPlaces? touristPlace;
  final List<String>?
      imageUrls; // Nueva propiedad para almacenar URLs de imágenes

  AddTouristPlaceState({
    this.status = AddTouristPlaceStatus.initial,
    this.errorMessage,
    this.touristPlace,
    this.imageUrls,
  });

  AddTouristPlaceState copyWith({
    AddTouristPlaceStatus? status,
    String? errorMessage,
    TouristPlaces? touristPlace,
    List<String>? imageUrls,
  }) {
    return AddTouristPlaceState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      touristPlace: touristPlace ?? this.touristPlace,
      imageUrls: imageUrls ?? this.imageUrls,
    );
  }
}

class TouristPlaceAddNotifier extends StateNotifier<AddTouristPlaceState> {
  final TouristPlacesRepository repository;

  TouristPlaceAddNotifier(this.repository) : super(AddTouristPlaceState());

  Future<void> addTouristPlaceAndUploadImages({
    required String name,
    required String description,
    required String location,
    required int categoryId,
    required List<File> images,
  }) async {
    state = AddTouristPlaceState(status: AddTouristPlaceStatus.loading);
    try {
      final touristPlace = await repository.addTouristPlaces(
        name,
        description,
        location,
        categoryId,
      );
      final imageUrls = await repository.uploadImages(touristPlace.id, images);

      state = state.copyWith(
        status: AddTouristPlaceStatus.success,
        touristPlace: touristPlace,
        imageUrls: imageUrls,
      );
    } catch (e) {
      state = state.copyWith(
        status: AddTouristPlaceStatus.error,
        errorMessage: e.toString(),
      );
      throw Exception("Failed to add tourist place and upload images: $e");
    }
  }
}

final touristPlaceAddProvider =
    StateNotifierProvider<TouristPlaceAddNotifier, AddTouristPlaceState>((ref) {
  final repository = ref.watch(touristPlaceProvider);
  return TouristPlaceAddNotifier(repository);
});
