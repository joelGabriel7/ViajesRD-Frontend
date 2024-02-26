import 'package:flutter/material.dart';

class TouristPlaceScreen extends StatelessWidget {
  const TouristPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tourist Place Screen'),
        centerTitle: true,
      ),
      body: const Placeholder(),
    );
  }
}
