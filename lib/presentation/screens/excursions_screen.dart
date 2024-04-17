import 'package:flutter/material.dart';
import 'package:viajes/presentation/views/clients/excursion_view_client.dart';

class ExcursionsScreen extends StatelessWidget {
  const ExcursionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excursion Screen'),
        centerTitle: true,
      ),
      body: const ExcursionViewClient(),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}
