import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/agency.dart';
import 'package:viajes/presentation/provider/agency/agency_provider.dart';

final agencyInfoProvider =
    StateNotifierProvider<AgencyMapNotifier, Map<String, Agency>>((ref) {
  final agencyRepository = ref.watch(agencyProvider);
  return AgencyMapNotifier(getAgencyCallback: agencyRepository.getAgency);
});

typedef GetAgencyCallback = Future<Agency> Function(String id);

class AgencyMapNotifier extends StateNotifier<Map<String, Agency>> {
  final GetAgencyCallback getAgencyCallback;
  AgencyMapNotifier({required this.getAgencyCallback}) : super({});

  Future<void> getAgency(String id) async {
    if (state[id] != null) return;
    final agency = await getAgencyCallback(id);
    state = {...state, id: agency};
  }
}
