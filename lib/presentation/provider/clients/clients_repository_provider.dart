import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/infrastructure/datasources/clients_datasource._impl.dart';
import 'package:viajes/infrastructure/repository/clients_repositroy_impl.dart';

final clientsRepositoryProvider = Provider((ref) {
  return ClientsRepositoryImpl(ClienteApiDatasource());
});
