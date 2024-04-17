class ExcursionsResponses {
  final int agencyId;
  final int touristPlaceId;
  final DateTime dateExcursion;
  final int durationExcursion;
  final int price;
  final String description;
  final int availablePlaces;
  final int id;
  final Agency agency;
  final TouristPlace touristPlace;

  ExcursionsResponses({
    required this.agencyId,
    required this.touristPlaceId,
    required this.dateExcursion,
    required this.durationExcursion,
    required this.price,
    required this.description,
    required this.availablePlaces,
    required this.id,
    required this.agency,
    required this.touristPlace,
  });

  factory ExcursionsResponses.fromJson(Map<String, dynamic> json) =>
      ExcursionsResponses(
        agencyId: json["agency_id"] ?? 0,
        touristPlaceId: json["tourist_place_id"] ?? 0,
        dateExcursion: DateTime.parse(json["date_excursion"]),
        durationExcursion: json["duration_excursion"],
        price: json["price"],
        description: json["description"],
        availablePlaces: json["available_places"],
        id: json["id"],
        agency: Agency.fromJson(json["agency"]),
        touristPlace: TouristPlace.fromJson(json["tourist_place"]),
      );

  Map<String, dynamic> toJson() => {
        "agency_id": agencyId,
        "tourist_place_id": touristPlaceId,
        "date_excursion":
            "${dateExcursion.year.toString().padLeft(4, '0')}-${dateExcursion.month.toString().padLeft(2, '0')}-${dateExcursion.day.toString().padLeft(2, '0')}",
        "duration_excursion": durationExcursion,
        "price": price,
        "description": description,
        "available_places": availablePlaces,
        "id": id,
        "agency": agency.toJson(),
        "tourist_place": touristPlace.toJson(),
      };
}

class Agency {
  final String name;
  final String email;

  Agency({
    required this.name,
    required this.email,
  });

  factory Agency.fromJson(Map<String, dynamic> json) => Agency(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}

class TouristPlace {
  final String name;
  final String location;
  final List<Image> images;

  TouristPlace({
    required this.name,
    required this.location,
    required this.images,
  });

  factory TouristPlace.fromJson(Map<String, dynamic> json) => TouristPlace(
        name: json["name"],
        location: json["location"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "location": location,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  final int id;
  final String imageUrl;

  Image({
    required this.id,
    required this.imageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
      };
}
