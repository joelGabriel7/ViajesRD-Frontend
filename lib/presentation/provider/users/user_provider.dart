import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/domain/entity/user.dart';
import 'package:viajes/infrastructure/repository/user_repository_impl.dart';
import 'package:viajes/presentation/provider/users/user_repository.dart';

final userCreateProvider =
    StateNotifierProvider<UserCreatedNotifier, Map>((ref) {
  final repository = ref.watch(userProvider);
  return UserCreatedNotifier(repository);
});

class UserCreatedNotifier extends StateNotifier<Map<String, UserEntity>> {
  final UserRepositoryImpl repository;
  UserCreatedNotifier(this.repository) : super({});

  Future<void> createUser({
    required String username,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final user = await repository.createUser(username, email, password, role);
      state = {...state, username: user};
    } catch (e) {
      rethrow;
    }
  }
}
