import 'package:flutter/material.dart';

import '../views/agency/clients_view_by_agency.dart';

class ClientsScreen extends StatelessWidget {
  static const name = 'clients-name';
  const ClientsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de clientes'),
        centerTitle: true,
      ),
      body: const ClientsView(),
    );
  }
}
