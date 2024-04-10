import 'package:viajes/domain/datasource/agency_datasource.dart';
import 'package:viajes/domain/entity/agency.dart';
import 'package:viajes/domain/repository/agency_repository.dart';

class AgencyImplRepository extends AgencyRepository {
  final AgencyDataSource dataSource;
  AgencyImplRepository(this.dataSource);

  @override
  Future<Agency> createAgency(String name, String address, String phone,
      String email, String logo, String rnc) {
    return dataSource.createAgency(name, address, phone, email, logo, rnc);
  }

  @override
  Future<Agency> updateAgency(int id, String name, String address, String phone,
      String email, String logo, String rnc) {
    return dataSource.updateAgency(id, name, address, phone, email, logo, rnc);
  }

  @override
  Future<Agency> getAgency(String id) {
    return dataSource.getAgency(id);
  }

  @override
  Future<Agency> getAgencyByRnc(String rnc) {
    return dataSource.getAgencyByRnc(rnc);
  }
}
