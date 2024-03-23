import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/config/constants/enums.dart';
import 'package:viajes/infrastructure/repository/auth/auth_services_repository_impl.dart';
import 'package:viajes/presentation/provider/users/auth/login_provider.dart';

final authLoginNotifierProvider =
    StateNotifierProvider<AuthLoginNotifier, AuthState>((ref) {
  final authServicesApiDatasources = ref.watch(authenticationServiceProvider);
  return AuthLoginNotifier(
      authServicesApiDatasources: authServicesApiDatasources);
});

class AuthState {
  final AuthStatus status;
  final String errorMessage;

  AuthState({
    this.status = AuthStatus.unauthenticated,
    this.errorMessage = '',
  });
}

class AuthLoginNotifier extends StateNotifier<AuthState> {
  final AuthServicesRepositoryImpl authServicesApiDatasources;
  AuthLoginNotifier({required this.authServicesApiDatasources})
      : super(AuthState());
  Future<bool> login(String username, String password) async {
    state = AuthState(status: AuthStatus.isLoading);
    try {
      final isSuccess =
          await authServicesApiDatasources.login(username, password);
      if (isSuccess) {
        state = AuthState(status: AuthStatus.authenticated);
        return true;
      } else {
        state = AuthState(
            status: AuthStatus.error, errorMessage: "Credenciales incorrectas");
        return false;
      }
    } catch (e) {
      state = AuthState(status: AuthStatus.error, errorMessage: e.toString());
      return false;
    }
  }

  String get lastErrorMessage => state.errorMessage;
}
