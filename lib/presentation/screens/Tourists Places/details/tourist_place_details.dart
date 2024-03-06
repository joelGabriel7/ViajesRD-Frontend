import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/tourist_places/tourist_place_provider.dart';

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
    return const Scaffold();
  }
}
