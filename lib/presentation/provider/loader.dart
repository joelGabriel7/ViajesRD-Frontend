import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/categories/categories_provider.dart';

final initlLoadingProvider = Provider((ref) {
  final step1 = ref.watch(getAllCategoryProvider).isEmpty;

  if (step1) return true;

  return false;
});
