import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/infrastructure/repository/agency_repository_impl.dart';

import '../../../infrastructure/datasources/agency_datasource.dart';

final agencyProvider =
    Provider((ref) => AgencyImplRepository(AgencyApiDatasource()));
