import 'package:flutter/material.dart';

class ReservationsScreen extends StatelessWidget {
  static const name = 'reservations-name';
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservations Screen'),
        centerTitle: true,
      ),
      body: const Center(child: Text('List reservations')),
    );
  }
}
