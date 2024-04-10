import 'package:viajes/domain/datasource/user_datasource.dart';
import 'package:viajes/domain/entity/user.dart';
import 'package:viajes/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDatasource datasource;
  UserRepositoryImpl(this.datasource);

  @override
  Future<UserEntity> createUser(
    String username,
    String email,
    String password,
    String role,
    int? agencyId,
    int? clientId,
  ) {
    return datasource.createUser(
        username, email, password, role, agencyId, clientId);
  }
}
