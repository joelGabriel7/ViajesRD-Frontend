import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
        },
        children: const [
          NavigationDrawerDestination(
              icon: Icon(Icons.home_filled), label: Text('Home Screen')),
          NavigationDrawerDestination(
              icon: Icon(Icons.category_rounded), label: Text('Categorias')),
          NavigationDrawerDestination(
              icon: Icon(Icons.place), label: Text('Lugares Turisticos')),
          NavigationDrawerDestination(
              icon: Icon(Icons.group), label: Text('Clientes')),
          NavigationDrawerDestination(
              icon: Icon(Icons.event_available), label: Text('Resevaciones')),
          NavigationDrawerDestination(
              icon: Icon(Icons.landscape_rounded), label: Text('Excursiones')),
        ]);
  }
}
