import 'package:viajes/domain/datasource/clients_datasource.dart';
import 'package:viajes/domain/entity/clients.dart';
import 'package:viajes/domain/repository/clients_repositort.dart';

class ClientsRepositoryImpl extends ClientsRepository {
  final ClientsDatasources datasources;
  ClientsRepositoryImpl(this.datasources);

  @override
  Future<List<Clients>> getClients() {
    return datasources.getClients();
  }
}
