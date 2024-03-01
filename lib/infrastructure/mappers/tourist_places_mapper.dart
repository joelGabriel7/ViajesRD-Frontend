import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/infrastructure/models/tourist_places_models.dart';

class TouristPlacesMapper {
  static TouristPlaces touristPlacesToEntity(
          TouristPlacesResponses touristPlaces) =>
      TouristPlaces(
          name: touristPlaces.name,
          description: touristPlaces.description,
          location: touristPlaces.location,
          categoryId: touristPlaces.categoryId,
          id: touristPlaces.id,
          category: touristPlaces.category,
          images: touristPlaces.images);
}
