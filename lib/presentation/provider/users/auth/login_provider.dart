import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/infrastructure/datasources/auth/auth_services_datasources.dart';
import 'package:viajes/infrastructure/repository/auth/auth_services_repository_impl.dart';

final authenticationServiceProvider = Provider<AuthServicesRepositoryImpl>(
  (ref) => AuthServicesRepositoryImpl(AuthServicesApiDatasources()),
);
