import 'package:viajes/domain/entity/clients.dart';

abstract class ClientsRepository {
  Future<List<Clients>> getClients();
}
