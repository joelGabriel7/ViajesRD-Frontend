class CategoryResponse {
  final String name;
  final String? description;
  final String codeCategory;
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryResponse({
    required this.name,
    required this.description,
    required this.codeCategory,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        name: json["name"],
        description: json["description"] ?? '',
        codeCategory: json["code_category"],
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "code_category": codeCategory,
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
