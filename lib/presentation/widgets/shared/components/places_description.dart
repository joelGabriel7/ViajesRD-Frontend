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
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: 55,
            decoration: const BoxDecoration(
                color: Color(0XFFFFE6E6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: const Icon(
              Icons.favorite,
              color: Color(0XFFFF4848),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 14),
          child: Text(
            places.description,
            style: textStyles.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          'Categoria - ${places.category.name}',
          style: textStyles.bodyLarge,
        ),
      ],
    );
  }
}
