import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/categories/categories_provider.dart';
import 'package:viajes/presentation/provider/clients/clients_provider.dart';

final initlLoadingProvider = Provider((ref) {
  final step1 = ref.watch(getAllCategoryProvider).isEmpty;
  final step2 = ref.watch(getClientsProvider).isEmpty;

  if (step1 || step2) return true;

  return false;
});
