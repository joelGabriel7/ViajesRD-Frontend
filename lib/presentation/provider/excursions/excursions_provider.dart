import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/presentation/provider/excursions/excursions_repository_provider.dart';

final excursionsProvider =
    StateNotifierProvider<ExcursionsNotifier, List<Excursion>>((ref) {
  final excursionsRepository = ref.read(excursionsRepositoryProvider);

  return ExcursionsNotifier(
      getExcursions: excursionsRepository.getExcursions, ref: ref);
});

typedef GetExcursionsCallBack = Future<List<Excursion>> Function();

class ExcursionsNotifier extends StateNotifier<List<Excursion>> {
  final GetExcursionsCallBack getExcursions;
  final Ref ref;

  ExcursionsNotifier({
    required this.getExcursions,
    required this.ref,
  }) : super([]);

  Future<List<Excursion>> getExcursionsByQuery() async {
    final List<Excursion> excursions = await getExcursions();
    state = excursions;
    return excursions;
  }
}
