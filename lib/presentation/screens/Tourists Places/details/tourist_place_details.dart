import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TouristPlaceDetailsScreen extends ConsumerStatefulWidget {
  final int touristPlaceId;
  const TouristPlaceDetailsScreen({super.key, required this.touristPlaceId});

  @override
  TouristPlaceDetailsScreenState createState() =>
      TouristPlaceDetailsScreenState();
}

class TouristPlaceDetailsScreenState
    extends ConsumerState<TouristPlaceDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
