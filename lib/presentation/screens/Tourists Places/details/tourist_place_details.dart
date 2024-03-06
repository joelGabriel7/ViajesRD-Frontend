import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/domain/entity/tourist_places.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_place_provider.dart';

import '../../../widgets/rounded_icon_buttom.dart';
import '../../../widgets/shared/components/place_detail_body.dart';
import '../../../widgets/shared/components/custom_app_bar.dart';

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
    final TouristPlaces? place = ref.watch(placeInfoProvider)[widget.placeId];
    if (place == null) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: CustomAppBar(
          customAppBar: RoundendIconBtn(
        iconData: Icons.arrow_back,
        press: () => context.pop(),
      )),
      body: PlaceDetailBodyView(places: place),
    );
  }
}



// Custom App Bar
