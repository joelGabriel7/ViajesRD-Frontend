import 'package:flutter/material.dart';

class HomeScreenClient extends StatelessWidget {
  const HomeScreenClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreenClient'),
      ),
      body: const Center(
        child: Text('HomeScreenClient is working'),
      ),
    );
  }
}
