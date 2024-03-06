import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viajes/presentation/provider/providers.dart';
import '../../provider/loader.dart';

class ClientsView extends ConsumerStatefulWidget {
  const ClientsView({super.key});

  @override
  ClientsViewState createState() => ClientsViewState();
}

class ClientsViewState extends ConsumerState<ClientsView> {
  @override
  void initState() {
    super.initState();
    ref.read(getClientsProvider.notifier).loadClients();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initlLoadingProvider);
    if (initialLoading) {
      return const Center(
          child: CircularProgressIndicator(
        strokeWidth: 5,
      ));
    }
    final clients = ref.watch(getClientsProvider);

    return RefreshIndicator(
      onRefresh: () async {
        ref.watch(getClientsProvider.notifier).loadClients();
      },
      child: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          final client = clients[index];
          return Card(
            elevation: 0,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Bordes redondeados
            ),
            child: ExpansionTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  client.firstName[0],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                '${client.firstName} ${client.lastName}',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blue.shade300),
              ),
              children: <Widget>[
                ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRichText('Email: ', client.email),
                      _buildRichText('Género: ', client.gender),
                      _buildRichText('Teléfono: ', client.phone),
                      _buildRichText('Dirección: ', client.address),
                      _buildRichText(
                        'Fecha de Nacimiento: ',
                        DateFormat('yyyy-MM-dd').format(client.birthDate),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildRichText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          children: <TextSpan>[
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors
                    .grey, // Cambia el color para darle un estilo distinto
              ),
            ),
          ],
        ),
      ),
    );
  }
}
