import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/helpers/auth/storage_token.dart';

class HomeScreenClient extends StatelessWidget {
  const HomeScreenClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeScreenClient'),
        actions: [
          IconButton(
              onPressed: () async {
                final SecureStorage secureStorage = SecureStorage();
                await secureStorage.deleteToken();
                // ignore: use_build_context_synchronously
                context.go('/login');
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: const Center(
        child: Text('HomeScreenClient is working'),
      ),
    );
  }
}
