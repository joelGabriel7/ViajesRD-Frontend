class TouristPlacesResponses {
  final String name;
  final String description;
  final String location;
  final int categoryId;
  final int id;
  final Categories category;
  final List<Images> images;

  TouristPlacesResponses({
    required this.name,
    required this.description,
    required this.location,
    required this.categoryId,
    required this.id,
    required this.category,
    required this.images,
  });

  factory TouristPlacesResponses.fromJson(Map<String, dynamic> json) =>
      TouristPlacesResponses(
        name: json["name"],
        description: json["description"],
        location: json["location"],
        categoryId: json["category_id"],
        id: json["id"],
        category: Categories.fromJson(json["category"]),
        images:
            List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "location": location,
        "category_id": categoryId,
        "id": id,
        "category": category.toJson(),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Categories {
  final String name;
  final String codeCategory;

  Categories({
    required this.name,
    required this.codeCategory,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        name: json["name"],
        codeCategory: json["code_category"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code_category": codeCategory,
      };
}

class Images {
  final int id;
  final String imageUrl;

  Images({
    required this.id,
    required this.imageUrl,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
      };
}
