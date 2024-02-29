import 'package:flutter/material.dart';

class ExcursionsScreen extends StatelessWidget {
  const ExcursionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Excursion Screen'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return const Text('data');
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 9),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
    );
  }
}
