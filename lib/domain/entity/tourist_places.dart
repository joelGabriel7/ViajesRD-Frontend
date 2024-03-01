import 'package:viajes/domain/entity/category.dart';

class TouristPlaces {
  final String name;
  final String description;
  final String location;
  final int categoryId;
  final int id;
  final Category category;
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
