// To parse this JSON data, do
//
//     final clientsResponses = clientsResponsesFromJson(jsonString);

class ClientsResponses {
  final String firstName;
  final String lastName;
  final DateTime birthDate;
  final String gender;
  final String phone;
  final String email;
  final String address;
  final String clientCode;
  final int id;
  final DateTime created;
  final DateTime updated;

  ClientsResponses({
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.gender,
    required this.phone,
    required this.email,
    required this.address,
    required this.clientCode,
    required this.id,
    required this.created,
    required this.updated,
  });

  factory ClientsResponses.fromJson(Map<String, dynamic> json) =>
      ClientsResponses(
        firstName: json["first_name"],
        lastName: json["last_name"],
        birthDate: DateTime.parse(json["birth_date"]),
        gender: json["gender"],
        phone: json["phone"],
        email: json["email"],
        address: json["address"],
        clientCode: json["client_code"],
        id: json["id"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "birth_date":
            "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone": phone,
        "email": email,
        "address": address,
        "client_code": clientCode,
        "id": id,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
      };
}
