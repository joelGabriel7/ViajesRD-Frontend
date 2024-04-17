import 'package:viajes/domain/datasource/excursions.dart';
import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/domain/repository/excursions.dart';

class ExcursionsRepositoryImpl implements ExcursionRespository {
  final ExcursionDatasources excursionsDataSource;

  ExcursionsRepositoryImpl({required this.excursionsDataSource});

  @override
  Future<List<Excursion>> getExcursions() async {
    return excursionsDataSource.getExcursions();
  }

  @override
  Future<Excursion> getExcursion(String id) {
    return excursionsDataSource.getExcursion(id);
  }

  @override
  Future<void> createExcursion(Excursion excursion) {
    return excursionsDataSource.createExcursion(excursion);
  }

  @override
  Future<void> updateExcursion(Excursion excursion) {
    return excursionsDataSource.updateExcursion(excursion);
  }

  @override
  Future<void> deleteExcursion(String id) {
    return excursionsDataSource.deleteExcursion(id);
  }
}
