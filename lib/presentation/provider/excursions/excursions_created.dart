import 'package:viajes/domain/entity/excursions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/repository/excursions.dart';
import 'package:viajes/presentation/provider/excursions/excursions_repository_provider.dart';

abstract class ExcursionState {
  const ExcursionState();
}

class Initial extends ExcursionState {
  const Initial();
}

class Loading extends ExcursionState {
  const Loading();
}

class Success extends ExcursionState {
  final Excursion excursion;
  const Success(this.excursion);
}

class Error extends ExcursionState {
  final String message;
  const Error(this.message);
}

final excursionNotifierProvider =
    StateNotifierProvider<ExcursionNotifier, ExcursionState>((ref) {
  return ExcursionNotifier(ref.watch(excursionsRepositoryProvider));
});

class ExcursionNotifier extends StateNotifier<ExcursionState> {
  final ExcursionRespository _excursionRepository;

  ExcursionNotifier(this._excursionRepository) : super(const Initial());

  Future<void> createExcursion(Excursion excursion) async {
    state = const Loading();
    try {
      await _excursionRepository.createExcursion(excursion);
      state = Success(excursion);
    } catch (e) {
      state = Error(e.toString());
    }
  }
}
