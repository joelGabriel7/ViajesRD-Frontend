import 'package:flutter/material.dart';

class ClientsScreen extends StatelessWidget {
  static const name = 'clients-name';
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cliente Screen'),
        centerTitle: true,
      ),
      body: Placeholder(),
    );
  }
}
