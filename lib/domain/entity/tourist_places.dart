import 'package:viajes/infrastructure/models/tourist_places_models.dart';

class TouristPlaces {
  final String name;
  final String description;
  final String location;
  final int categoryId;
  final int id;
  final Categories category;
  final List images;

  TouristPlaces({
    required this.name,
    required this.description,
    required this.location,
    required this.categoryId,
    required this.id,
    required this.category,
    required this.images,
  });
}
