import 'package:flutter/material.dart';

class TouristPlaceDetailsScreen extends StatelessWidget {
  final int touristPlaceId;
  const TouristPlaceDetailsScreen({super.key, required this.touristPlaceId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle de lugar turisticos')),
      body: Center(child: Text('detalles de lugares turisiticos')),
    );
  }
}
