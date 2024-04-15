import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/agency.dart';
import 'package:viajes/presentation/provider/agency/agency_provider.dart';

final agencyInfoProvider =
    StateNotifierProvider<AgencyMapNotifier, Map<String, Agency>>((ref) {
  final agencyRepository = ref.watch(agencyProvider);
  return AgencyMapNotifier(
      getAgencyCallback: agencyRepository.getAgencyByRnc,
      getAgencyByIdCallBack: agencyRepository.getAgency);
});

typedef GetAgencyCallback = Future<Agency> Function(String rnc);
typedef GetAgencyByIdCallback = Future<Agency> Function(String id);

class AgencyMapNotifier extends StateNotifier<Map<String, Agency>> {
  final GetAgencyCallback getAgencyCallback;
  final GetAgencyByIdCallback getAgencyByIdCallBack;
  AgencyMapNotifier(
      {required this.getAgencyCallback, required this.getAgencyByIdCallBack})
      : super({});

  Future<void> getAgency(String id) async {
    if (state[id] != null) return;
    final agency = await getAgencyByIdCallBack(id);
    state = {...state, id: agency};
  }

  Future<void> getAgencyByRnc(String rnc) async {
    final agency = await getAgencyCallback(rnc);
    state = {...state, rnc: agency};
  }
}
