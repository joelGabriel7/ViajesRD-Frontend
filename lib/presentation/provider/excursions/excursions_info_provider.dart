import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/presentation/provider/excursions/excursions_repository_provider.dart';

final excursionInfoProvider =
    StateNotifierProvider<ExcursionInfoStateNotifer, Map<String, Excursion>>(
        (ref) {
  final excursionsRepository = ref.read(excursionsRepositoryProvider);
  return ExcursionInfoStateNotifer(
      getExcursion: excursionsRepository.getExcursion);
});

typedef GetExcursionCallBack = Future<Excursion> Function(String id);

class ExcursionInfoStateNotifer extends StateNotifier<Map<String, Excursion>> {
  ExcursionInfoStateNotifer({required this.getExcursion}) : super({});
  final GetExcursionCallBack getExcursion;

  Future<void> loadExcursion(String id) async {
    if (state[id] != null) return;
    final excursion = await getExcursion(id);
    state = {...state, id: excursion};
  }
}
