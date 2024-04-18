import 'package:flutter/material.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/theme/app_theme.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/screens/excursiones_created.dart';
import 'package:viajes/presentation/widgets/shared/components/places_images.dart';
import 'package:viajes/presentation/widgets/shared/components/top_rounded_container.dart';
import 'package:viajes/presentation/widgets/shared/custom_bottom.dart';

import 'places_description.dart';

class PlaceDetailBody extends StatelessWidget {
  final TouristPlaces places;
  const PlaceDetailBody({super.key, required this.places});

  void _showCreateExcursionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Esto permite que el modal se ajuste al contenido interno
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Ajusta el padding inferior según el teclado
          ),
          child: CreateExcursionForm(places: places),
        );
      },
    ).then((_) => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Excursión creada con éxito!')),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // Create an instance of AppTheme to access your text themes
    final appTheme = AppTheme();

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? TColors.dark : TColors.white;
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
                  color: backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: PlacesDescriptions(
                        places: places, textStyles: textStyles),
                  ),
                ),
                Container(
                  color: backgroundColor,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: DefaultButton(
                        text: 'Crea una excursión',
                        press: () => _showCreateExcursionModal(context)),
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
