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

  TouristPlaces copyWith({
    String? name,
    String? description,
    String? location,
    int? categoryId,
    int? id,
    Categories? category,
    List? images,
  }) {
    return TouristPlaces(
      name: name ?? this.name,
      description: description ?? this.description,
      location: location ?? this.location,
      categoryId: categoryId ?? this.categoryId,
      id: id ?? this.id,
      category: category ?? this.category,
      images: images ?? this.images,
    );
  }
}





// class TouristPlaces {
//   final String name;
//   final String description;
//   final String location;
//   final int categoryId;
//   final int id;
//   final Categories category;
//   final List images;

//   TouristPlaces({
//     required this.name,
//     required this.description,
//     required this.location,
//     required this.categoryId,
//     required this.id,
//     required this.category,
//     required this.images,
//   });

//   TouristPlaces copyWith({
//     String? name,
//     String? description,
//     String? location,
//     int? categoryId,
//     int? id,
//     Categories? category,
//     List? images,
//   }) {
//     return TouristPlaces(
//       name: name ?? this.name,
//       description: description ?? this.description,
//       location: location ?? this.location,
//       categoryId: categoryId ?? this.categoryId,
//       id: id ?? this.id,
//       category: category ?? this.category,
//       images: images ?? this.images,
//     );
//   }
// }

