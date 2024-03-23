import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/config/constants/enums.dart';
import 'package:viajes/infrastructure/repository/auth/auth_services_repository_impl.dart';
import 'package:viajes/presentation/provider/users/auth/login_provider.dart';

final authLoginNotifierProvider =
    StateNotifierProvider<AuthLoginNotifier, AuthStatus>((ref) {
  final authLoginProvider = ref.watch(authenticationServiceProvider);
  return AuthLoginNotifier(authLoginProvider);
});

class AuthLoginNotifier extends StateNotifier<AuthStatus> {
  final AuthServicesRepositoryImpl _authServicesApiDatasources;
  AuthLoginNotifier(this._authServicesApiDatasources)
      : super(AuthStatus.unauthenticated);

  Future<void> login(String username, String password) async {
    state = AuthStatus.isLoading;
    try {
      final isSuccess =
          await _authServicesApiDatasources.login(username, password);
      if (isSuccess) {
        state = AuthStatus.authenticated;
      }
    } catch (e) {
      state = AuthStatus.unauthenticated;
    }
  }
}
