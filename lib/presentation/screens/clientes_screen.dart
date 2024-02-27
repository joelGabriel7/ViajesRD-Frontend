import 'package:flutter/material.dart';

class ClientsScreen extends StatelessWidget {
  static const name = 'clients-name';
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clients Screen'),
        centerTitle: true,
      ),
      body: const Placeholder(),
    );
  }
}
