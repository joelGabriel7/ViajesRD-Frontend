import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/users/user_provider.dart';

class UserCreateView {
  final WidgetRef ref;
  UserCreateView({required this.ref});

  Future<void> createUser({
    required String username,
    required String email,
    required String password,
    required String role,
  }) async {
    final userCreate = ref.read(userCreateProvider.notifier);

    try {
      await userCreate.createUser(
          username: username, email: email, password: password, role: role);
    } catch (e) {
      rethrow;
    }
    // Lógica para crear un usuario
  }
}
