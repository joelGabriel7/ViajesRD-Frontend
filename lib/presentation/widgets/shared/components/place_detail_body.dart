import 'package:flutter/material.dart';
import 'package:viajes/config/theme/app_theme.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/widgets/shared/components/places_images.dart';

import 'top_rounded_container.dart';

class PlaceDetailBodyView extends StatelessWidget {
  final TouristPlaces places;
  const PlaceDetailBodyView({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    // Create an instance of AppTheme to access your text themes
    final appTheme = AppTheme();

    // Use the text theme directly
    final textStyles = appTheme.textTheme();
    const String base = 'https://apiviajesrd.info/';

    return PlacesDescriptios(
        base: base, places: places, textStyles: textStyles);
  }
}

class PlacesDescriptios extends StatelessWidget {
  const PlacesDescriptios({
    super.key,
    required this.base,
    required this.places,
    required this.textStyles,
  });

  final String base;
  final TouristPlaces places;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlaceImages(base: base, places: places),
        Expanded(
          child: TopRoundedContainer(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
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
                    padding: const EdgeInsets.only(left: 5, right: 10),
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
              ),
            ),
          ),
        )
      ],
    );
  }
}
