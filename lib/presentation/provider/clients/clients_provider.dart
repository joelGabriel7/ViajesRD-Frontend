import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/providers.dart';

import '../../../domain/entity/clients.dart';

final getClientsProvider =
    StateNotifierProvider<ClientsNotifier, List<Clients>>((ref) {
  final fetchMoreClients = ref.watch(clientsRepositoryProvider).getClients;
  return ClientsNotifier(fetchMoreClients: fetchMoreClients);
});

typedef ClientCallback = Future<List<Clients>> Function({int page});

class ClientsNotifier extends StateNotifier<List<Clients>> {
  int currentPage = 0;
  ClientCallback fetchMoreClients;

  ClientsNotifier({required this.fetchMoreClients}) : super([]);

  Future<void> loadClients() async {
    currentPage++;
    final List<Clients> clients = await fetchMoreClients(page: currentPage);
    state = clients;
  }
}
