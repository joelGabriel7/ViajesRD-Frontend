import 'package:viajes/domain/entity/excursions.dart';

abstract class ExcursionDatasources {
  Future<List<Excursion>> getExcursions();
  Future<Excursion> getExcursion(String id);
  Future<void> createExcursion(Excursion excursion);
  Future<void> updateExcursion(Excursion excursion);
  Future<void> deleteExcursion(String id);
}
