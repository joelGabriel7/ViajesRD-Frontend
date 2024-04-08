import 'package:viajes/config/constants/enums.dart';

class UserEntity {
  final int? id;
  final int? agencyId;
  final int? clientId;
  final String username;
  final String email;
  final String password;
  UserRole role;
  UserStatus status;

  UserEntity(
      {required this.id,
      required this.agencyId,
      required this.clientId,
      required this.password,
      required this.username,
      required this.email,
      required this.role,
      required this.status});
}
