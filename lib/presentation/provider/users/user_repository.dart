import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/infrastructure/datasources/user_datasource.dart';
import 'package:viajes/infrastructure/repository/user_repository_impl.dart';

final userProvider =
    Provider((ref) => UserRepositoryImpl(UserApiDatasources()));
