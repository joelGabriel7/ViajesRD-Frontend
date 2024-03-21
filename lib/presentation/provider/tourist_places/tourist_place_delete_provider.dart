import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/infrastructure/repository/tourist_places_repository_impl.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_places_repository.dart';

final placeDeleteProvider =
    StateNotifierProvider<PlaceDeleteNotifier, Map<int, bool>>((ref) {
  return PlaceDeleteNotifier(ref.watch(touristPlaceProvider));
});

class PlaceDeleteNotifier extends StateNotifier<Map<int, bool>> {
  final TouristPlacesRepositoryImpl repository;

  PlaceDeleteNotifier(this.repository) : super({});

  Future<void> deletePlace(int placeId) async {
    await repository.deleteTouristPlacesById(placeId);
    // Marcamos el lugar como eliminado
    state = {...state, placeId: true};
  }
}
