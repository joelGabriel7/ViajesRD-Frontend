import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viajes/presentation/provider/providers.dart';

class _CategoryView extends ConsumerStatefulWidget {
  const _CategoryView();

  @override
  _ReservationViewState createState() => _ReservationViewState();
}

class _ReservationViewState extends ConsumerState<_CategoryView> {
  @override
  void initState() {
    super.initState();
    ref.read(getAllCategoryProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(getAllCategoryProvider);

    return Scaffold(
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            title: Text(category.name),
            subtitle: Text(category.description),
          );
        },
      ),
    );
  }
}
