import 'package:viajes/domain/entity/agency.dart';

abstract class AgencyDataSource {
  Future<Agency> updateAgency(int id, String name, String address, String phone,
      String email, String logo, String rnc);
}
