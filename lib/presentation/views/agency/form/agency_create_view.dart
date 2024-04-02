import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/agency/agency_repository.dart';

class AgencyCreateView {
  final WidgetRef ref;
  AgencyCreateView({required this.ref});

  Future<void> createAgency({
    required String name,
    required String address,
    required String phone,
    required String email,
    required String logo,
    required String rnc,
  }) async {
    final agencyCreate = ref.read(agencyCreateProvider.notifier);

    try {
      await agencyCreate.createAgency(
          name: name,
          address: address,
          phone: phone,
          email: email,
          logo: logo,
          rnc: rnc);
    } catch (e) {
      rethrow;
    }
  }
}
