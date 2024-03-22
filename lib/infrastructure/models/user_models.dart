// To parse this JSON data, do
//
//     final userResponses = userResponsesFromJson(jsonString);

import 'dart:convert';

import 'package:viajes/config/constants/enums.dart';

List<UserResponses> userResponsesFromJson(String str) =>
    List<UserResponses>.from(
        json.decode(str).map((x) => UserResponses.fromJson(x)));

String userResponsesToJson(List<UserResponses> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserResponses {
  final String username;
  final String email;
  final UserStatus status;
  final UserRole role;
  final int id;
  final String hashedPassword;
  final DateTime created;
  final DateTime updated;

  UserResponses({
    required this.username,
    required this.email,
    required this.status,
    required this.role,
    required this.id,
    required this.hashedPassword,
    required this.created,
    required this.updated,
  });

  factory UserResponses.fromJson(Map<String, dynamic> json) => UserResponses(
        username: json["username"],
        email: json["email"],
        status: statusValues.map[json["status"]]!,
        role: roleValues.map[json["role"]]!,
        id: json["id"],
        hashedPassword: json["hashed_password"],
        created: DateTime.parse(json["created"]),
        updated: DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "status": statusValues.reverse[status],
        "role": roleValues.reverse[role],
        "id": id,
        "hashed_password": hashedPassword,
        "created": created.toIso8601String(),
        "updated": updated.toIso8601String(),
      };
}

final roleValues =
    EnumValues({"agency": UserRole.agency, "client": UserRole.client});

final statusValues = EnumValues({
  "active": UserStatus.active,
  "deactive": UserStatus.deactive,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
