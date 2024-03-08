import 'package:flutter/material.dart';

class TouristPlacesCreateScreen extends StatelessWidget {
  const TouristPlacesCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crea un lugar turistico'),
      ),
      body: const Center(child: Text('Formulario')),
    );
  }
}
