import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_places_repository.dart';

import '../../../domain/entity/tourist_places.dart';

final getTouristPlacesProvider =
    StateNotifierProvider<TouristPlacesNotifier, List<TouristPlaces>>((ref) {
  final fetchMoreTouristPlaces =
      ref.watch(touristPlaceProvider).getTouristPlaces;
  return TouristPlacesNotifier(fetchMoreTouristPlaces: fetchMoreTouristPlaces);
});

typedef TouristPlacesCallback = Future<List<TouristPlaces>> Function(
    {int page});

class TouristPlacesNotifier extends StateNotifier<List<TouristPlaces>> {
  int currentPage = 0;
  TouristPlacesCallback fetchMoreTouristPlaces;

  TouristPlacesNotifier({required this.fetchMoreTouristPlaces}) : super([]);

  Future<void> loadTouristPlaces() async {
    currentPage++;

    final List<TouristPlaces> touristPlaces =
        await fetchMoreTouristPlaces(page: currentPage);
    state = touristPlaces;
  }
}
