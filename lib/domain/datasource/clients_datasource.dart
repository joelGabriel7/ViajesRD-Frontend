import 'package:viajes/domain/entity/clients.dart';

abstract class ClientsDatasources {
  Future<List<Clients>> getClients();
}
