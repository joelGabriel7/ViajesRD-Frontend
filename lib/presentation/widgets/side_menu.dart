import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffolKey;
  const SideMenu({super.key, required this.scaffolKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
        backgroundColor: Colors.grey.shade50,
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;

            final menuItem = appMenuItem[value];
            context.push(menuItem.link);
            // widget.scaffolKey.currentState?.closeDrawer();
          });
        },
        children: [
          const SizedBox(
            height: 15,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 20, 16, 10),
            child: Text('Opciones Principales'),
          ),
          const SizedBox(
            height: 15,
          ),
          ...appMenuItem.sublist(0, 2).map(
                (value) => NavigationDrawerDestination(
                    icon: Icon(value.icon), label: Text(value.title)),
              ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 20, 16, 10),
            child: Text('Mas Opciones'),
          ),
          ...appMenuItem.sublist(2).map(
                (item) => NavigationDrawerDestination(
                    icon: Icon(item.icon), label: Text(item.title)),
              ),
        ]);
  }
}
