import 'package:viajes/domain/entity/clients.dart';
import 'package:viajes/infrastructure/models/clients_models.dart';

class ClientsMapper {
  static Clients clientstoEntity(ClientsResponses clients) => Clients(
      firstName: clients.firstName,
      lastName: clients.lastName,
      birthDate: clients.birthDate,
      gender: clients.gender,
      phone: clients.phone,
      email: clients.email,
      address: clients.address,
      clientCode: clients.clientCode,
      id: clients.id,
      created: clients.created,
      updated: clients.updated);
}
