import 'package:flutter/material.dart';
import 'package:viajes/presentation/views/clients/home_view_client.dart';
import 'package:viajes/presentation/widgets/client/bottom_navigations.dart';

class HomeScreenClient extends StatelessWidget {
  final int pageIndex;
  const HomeScreenClient({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //         onPressed: () async {
      //           final SecureStorage secureStorage = SecureStorage();
      //           await secureStorage.deleteToken();
      //           // ignore: use_build_context_synchronously
      //           context.go('/login');
      //         },
      //         icon: const Icon(Icons.logout_outlined))
      //   ],
      // ),
      bottomNavigationBar: BottomNavigationsClient(currentPage: pageIndex),
      body: IndexedStack(
        index: pageIndex,
        children: [
          const HomeViewClient(),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.deepOrange,
          ),
        ],
      ),
    );
  }
}
