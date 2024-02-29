class Clients {
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

  Clients(
      {required this.firstName,
      required this.lastName,
      required this.birthDate,
      required this.gender,
      required this.phone,
      required this.email,
      required this.address,
      required this.clientCode,
      required this.id,
      required this.created,
      required this.updated});
}
