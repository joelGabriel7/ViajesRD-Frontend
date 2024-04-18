import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/presentation/provider/excursions/excursions_repository_provider.dart';

final excursionsProvider =
    StateNotifierProvider<ExcursionsNotifier, List<Excursion>>((ref) {
  final excursionsRepository = ref.read(excursionsRepositoryProvider);
  return ExcursionsNotifier(
      getExcursionsCustom: excursionsRepository.getExcursions);
});
final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});
typedef GetExcursionsCallBack = Future<List<Excursion>> Function({int page});

class ExcursionsNotifier extends StateNotifier<List<Excursion>> {
  final GetExcursionsCallBack getExcursionsCustom;
  // final Ref ref;
  int currentPage = 0;
  ExcursionsNotifier({
    required this.getExcursionsCustom,
  }) : super([]);

  Future<void> loadMoreExcursion() async {
    currentPage++;
    final excursions = await getExcursionsCustom(page: currentPage);
    state = excursions;
  }

  Future<Excursion?> getExcursionByTouristPlaceId(int touristPlaceId) async {
    // Simulando una búsqueda por ID de lugar turístico.
    return state.firstWhereOrNull(
        (excursion) => excursion.touristPlaceId == touristPlaceId);
  }
}

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(CartItem item) {
    state = [...state, item];
  }

  void removeFromCart(CartItem item) {
    state = state
        .where(
            (i) => i.excursion.touristPlaceId != item.excursion.touristPlaceId)
        .toList();
  }

  bool isExcursionInCart(int excursionId) {
    return state.any((item) => item.excursion.id == excursionId);
  }

  void updateQuantity(CartItem item, int newQuantity) {
    state = state.map((i) {
      if (i.excursion.id == item.excursion.id) {
        return CartItem(excursion: i.excursion, quantity: newQuantity);
      }
      return i;
    }).toList();
  }

  double get total {
    return state.fold(
        0, (previousValue, element) => previousValue + element.totalPrice);
  }
}
