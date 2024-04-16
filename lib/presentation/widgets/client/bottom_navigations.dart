import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationsClient extends StatelessWidget {
  final int currentPage;
  const BottomNavigationsClient({super.key, required this.currentPage});

  void onTapItemClient(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home/client/0');
        break;
      case 1:
        context.go('/home/client/1');
        break;
      case 2:
        context.go('/home/client/2');
        break;
      case 3:
        context.go('/home/client/3');
        break;
      case 4:
        context.go('/home/client/4');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentPage,
        // backgroundColor: Colors.green,
        type: BottomNavigationBarType.fixed, // Asegura color de fondo sólido
        selectedItemColor: Colors.blue, // Color para el ítem seleccionado
        unselectedItemColor: Colors.grey,
        onTap: (index) => onTapItemClient(context, index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'Destinos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.landscape_outlined), label: 'Excursiones'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Profile'),
        ]);
  }
}
