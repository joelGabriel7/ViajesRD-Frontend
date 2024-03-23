import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/users/auth/auth_login_provider.dart';

class LoginView {
  final WidgetRef ref;
  LoginView({required this.ref});

  Future<bool> login(
      {required String username, required String password}) async {
    final authServicesRepository = ref.read(authLoginNotifierProvider.notifier);
    return await authServicesRepository.login(username, password);
  }
}
