import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:viajes/presentation/provider/providers.dart';

import '../../provider/loader.dart';

class ClientsView extends ConsumerStatefulWidget {
  const ClientsView({
    super.key,
  });

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

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: clients.length,
      itemBuilder: (context, index) {
        final client = clients[index];
        if (clients.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
              leading: const Icon(
                Icons.person,
                size: 50,
              ),
              title: Text(
                '${client.firstName} ${client.lastName}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              children: <Widget>[
                ListTile(
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
        }
        return const CircularProgressIndicator(
          strokeWidth: 2,
        );
      },
    );
  }
}

Widget _buildRichText(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(top: 4.0),
    child: RichText(
      text: TextSpan(
        text: label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black, // Asegúrate de que el color sea legible
        ),
        children: <TextSpan>[
          TextSpan(
            text: value,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
