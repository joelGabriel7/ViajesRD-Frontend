import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/presentation/provider/excursions/excursions_repository_provider.dart';

final excursionsProvider =
    StateNotifierProvider<ExcursionsNotifier, List<Excursion>>((ref) {
  final excursionsRepository = ref.read(excursionsRepositoryProvider);
  return ExcursionsNotifier(
      getExcursionsCustom: excursionsRepository.getExcursions);
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
    state = [...state, ...excursions];
  }
}
