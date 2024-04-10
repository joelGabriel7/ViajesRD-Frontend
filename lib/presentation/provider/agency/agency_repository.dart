import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/agency.dart';
import 'package:viajes/infrastructure/repository/agency_repository_impl.dart';
import 'package:viajes/presentation/provider/agency/agency_provider.dart';

final agencyCreateProvider =
    StateNotifierProvider<AgencyStateNofier, Map>((ref) {
  final repository = ref.watch(agencyProvider);
  return AgencyStateNofier(repository);
});

class AgencyStateNofier extends StateNotifier<Map<String, Agency>> {
  final AgencyImplRepository repository;
  AgencyStateNofier(this.repository) : super({});

  Future<void> createAgency({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String logo,
    required String rnc,
  }) async {
    try {
      final agency =
          await repository.createAgency(name, address, phone, email, logo, rnc);
      state = {...state, name: agency};
    } catch (e) {
      rethrow;
    }
  }
}
