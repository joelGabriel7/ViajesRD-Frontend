class AgenciReponses {
  final String name;
  final String address;
  final String phone;
  final String email;
  final String logo;
  final String rnc;
  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;

  AgenciReponses({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.logo,
    required this.rnc,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AgenciReponses.fromJson(Map<String, dynamic> json) => AgenciReponses(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        logo: json["logo"],
        rnc: json["rnc"],
        id: json["id"] ?? 0,
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : DateTime.now(), // Proporciona un valor predeterminado
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : DateTime.now(), // Proporciona un valor predeterminado
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "logo": logo,
        "rnc": rnc,
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
