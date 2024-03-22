import 'package:viajes/domain/entity/user.dart';

abstract class UserDatasource {
  Future<UserEntity> createUser(
      String username, String email, String password, String role);
}
