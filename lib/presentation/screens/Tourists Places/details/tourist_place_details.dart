import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_place_provider.dart';
import '../../../widgets/shared/components/place_detail_body.dart';

class TouristPlaceDetailsScreen extends ConsumerStatefulWidget {
  final int placeId;
  const TouristPlaceDetailsScreen({super.key, required this.placeId});

  @override
  TouristPlaceDetailsScreenState createState() =>
      TouristPlaceDetailsScreenState();
}

class TouristPlaceDetailsScreenState
    extends ConsumerState<TouristPlaceDetailsScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(placeInfoProvider.notifier).loadPlace(widget.placeId);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final backgroundColor = isDarkMode ? TColors.dark : TColors.white;
    final TouristPlaces? place = ref.watch(placeInfoProvider)[widget.placeId];
    if (place == null) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(children: [
        PlaceDetailBody(places: place),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.arrow_back),
          ),
        ))
      ]),
    );
  }
}



// Custom App Bar
