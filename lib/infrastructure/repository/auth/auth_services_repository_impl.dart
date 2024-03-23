import 'package:viajes/domain/datasource/auth_services_datasources.dart';
import 'package:viajes/domain/repository/auth_services_repository.dart';

class AuthServicesRepositoryImpl extends AuthServicesRepository {
  final AuthServicesDatasource datasource;
  AuthServicesRepositoryImpl(this.datasource);

  @override
  Future<bool> login(String username, String password) {
    return datasource.login(username, password);
  }
}
