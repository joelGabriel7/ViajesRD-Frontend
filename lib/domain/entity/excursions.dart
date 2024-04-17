class Excursion {
  final int agencyId;
  final int touristPlaceId;
  final DateTime dateExcursion;
  final int durationExcursion;
  final double price;
  final String description;
  final int availablePlaces;
  final int id;

  Excursion({
    required this.agencyId,
    required this.touristPlaceId,
    required this.dateExcursion,
    required this.durationExcursion,
    required this.price,
    required this.description,
    required this.availablePlaces,
    required this.id,
  });
}
