import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_places_repository.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchPlacesProviders =
    StateNotifierProvider<SearchMovieNotifier, List<TouristPlaces>>((ref) {
  final placeRepository = ref.read(touristPlaceProvider);

  return SearchMovieNotifier(
      searchPlaces: placeRepository.searchTouristPlaces, ref: ref);
});

typedef SearchedPlacesCallBack = Future<List<TouristPlaces>> Function(
    String query);

class SearchMovieNotifier extends StateNotifier<List<TouristPlaces>> {
  final SearchedPlacesCallBack searchPlaces;
  final Ref ref;

  SearchMovieNotifier({
    required this.searchPlaces,
    required this.ref,
  }) : super([]);

  Future<List<TouristPlaces>> searchPlaceByQuery(String query) async {
    final List<TouristPlaces> places = await searchPlaces(query);
    ref.read(searchQueryProvider.notifier).update((state) => query);

    state = places;
    return places;
  }
}
