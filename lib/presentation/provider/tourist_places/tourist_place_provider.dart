import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_places_repository.dart';

final placeInfoProvider =
    StateNotifierProvider<TouristPlaceMapNotifier, Map<int, TouristPlaces>>(
        (ref) {
  final placeRepository = ref.watch(touristPlaceProvider);

  return TouristPlaceMapNotifier(
      getPlace: placeRepository.getTouristPlacesById);
});

typedef GetPlacesCallBack = Future<TouristPlaces> Function(int placeId);

class TouristPlaceMapNotifier extends StateNotifier<Map<int, TouristPlaces>> {
  final GetPlacesCallBack getPlace;
  TouristPlaceMapNotifier({required this.getPlace}) : super({});

  Future<void> loadPlace(int placeId) async {
    if (state[placeId] != null) return;

    final place = await getPlace(placeId);
    state = {placeId: place};
  }
}
