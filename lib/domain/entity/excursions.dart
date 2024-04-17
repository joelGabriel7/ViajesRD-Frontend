import 'package:viajes/infrastructure/models/excursions_models.dart';

class Excursion {
  final int agencyId;
  final int touristPlaceId;
  final DateTime dateExcursion;
  final int durationExcursion;
  final double price;
  final String description;
  final int availablePlaces;
  final int id;
  final Agency agencyE;
  final TouristPlace touristPlaces;

  Excursion({
    required this.agencyId,
    required this.touristPlaceId,
    required this.dateExcursion,
    required this.durationExcursion,
    required this.price,
    required this.description,
    required this.availablePlaces,
    required this.id,
    required this.agencyE,
    required this.touristPlaces,
  });
}
