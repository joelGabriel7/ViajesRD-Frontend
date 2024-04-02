import 'package:viajes/domain/entity/agency.dart';
import 'package:viajes/infrastructure/models/agency_models.dart';

class AgencyMapper {
  static Agency agencyToEntity(AgenciReponses agency) => Agency(
      id: agency.id,
      name: agency.name,
      address: agency.address,
      phone: agency.phone,
      email: agency.email,
      logo: agency.logo,
      rnc: agency.rnc);
}
