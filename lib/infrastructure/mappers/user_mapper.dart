import 'package:viajes/domain/entity/user.dart';
import 'package:viajes/infrastructure/models/user_models.dart';

class UserMapper {
  static UserEntity userToEntity(UserResponses user) => UserEntity(
      id: user.id,
      username: user.username,
      email: user.email,
      password: user.hashedPassword,
      role: user.role,
      status: user.status);
}
