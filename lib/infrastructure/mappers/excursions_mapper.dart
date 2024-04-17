import 'package:viajes/domain/entity/excursions.dart';
import 'package:viajes/infrastructure/models/excursions_models.dart';

class ExcursionMapper {
  static Excursion excursionToEntity(ExcursionsResponses excursion) =>
      Excursion(
          agencyId: excursion.agencyId,
          touristPlaceId: excursion.touristPlaceId,
          dateExcursion: excursion.dateExcursion,
          durationExcursion: excursion.durationExcursion,
          price: excursion.price,
          description: excursion.description,
          availablePlaces: excursion.availablePlaces,
          id: excursion.id);
}
