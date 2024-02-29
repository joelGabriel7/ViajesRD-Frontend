import 'package:dio/dio.dart';
import 'package:viajes/domain/datasource/clients_datasource.dart';
import 'package:viajes/domain/entity/clients.dart';
import 'package:viajes/infrastructure/mappers/clients_mapper.dart';
import 'package:viajes/infrastructure/models/clients_models.dart';

class ClienteApiDatasource extends ClientsDatasources {
  final dio = Dio(BaseOptions(baseUrl: 'http://192.168.1.3:8000'));

  @override
  Future<List<Clients>> getClients({int page = 1}) async {
    final response = await dio.get('/clients/list');
    List<dynamic> clientsResponse = response.data;
    final List<Clients> clients = clientsResponse
        .map((results) =>
            ClientsMapper.clientstoEntity(ClientsResponses.fromJson(results)))
        .toList();

    return clients;
  }
}
