import 'package:flutter/material.dart';
import 'package:viajes/domain/entity/tourist_places.dart';

class PlacesDescriptions extends StatelessWidget {
  const PlacesDescriptions({
    super.key,
    required this.places,
    required this.textStyles,
  });

  final TouristPlaces places;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          places.name,
          style: textStyles.titleLarge,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Localidad - ${places.location}',
          style: textStyles.bodyLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        const Align(
          alignment: Alignment.centerRight,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 14),
            child: Text(
              places.description,
              style: textStyles.bodyMedium,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Categoria - ${places.category.name}',
          style: textStyles.bodyLarge,
        ),
      ],
    );
  }
}
