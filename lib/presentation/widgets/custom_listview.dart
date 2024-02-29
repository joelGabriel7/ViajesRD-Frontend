import 'package:flutter/material.dart';

class CustomList extends StatelessWidget {
  const CustomList({
    super.key,
    required this.item,
  });

  final List item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listado de categorias')),
      body: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: item.length,
        itemBuilder: (context, index) {
          final category = item[index];
          if (item.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(5.0),
                title: Text(category.name),
                subtitle: Text(category.description),
              ),
            );
          }
          return const Center(child: Text("No hay categorias"));
        },
      ),
    );
  }
}
