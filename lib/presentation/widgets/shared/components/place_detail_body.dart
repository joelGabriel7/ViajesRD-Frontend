import 'package:flutter/material.dart';
import 'package:viajes/config/theme/app_theme.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/widgets/shared/components/places_images.dart';
import 'package:viajes/presentation/widgets/shared/components/top_rounded_container.dart';
import 'package:viajes/presentation/widgets/shared/custom_bottom.dart';

import 'places_description.dart';

class PlaceDetailBody extends StatelessWidget {
  final TouristPlaces places;
  const PlaceDetailBody({super.key, required this.places});

  @override
  Widget build(BuildContext context) {
    // Create an instance of AppTheme to access your text themes
    final appTheme = AppTheme();

    // Use the text theme directly
    final textStyles = appTheme.textTheme();
    const String base = 'https://apiviajesrd.info/';

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                PlaceImages(base: base, places: places),
                TopRoundedContainer(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: PlacesDescriptions(
                        places: places, textStyles: textStyles),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DefaultButton(
                      text: 'Crea una excursión',
                      press: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
