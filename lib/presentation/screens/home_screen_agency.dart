// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:viajes/config/constants/colors.dart';
import 'package:viajes/config/helpers/auth/storage_token.dart';
import 'package:viajes/config/menu/menu_item.dart';
import 'package:viajes/presentation/widgets/bottom_navigations.dart';
import 'package:viajes/presentation/widgets/side_menu.dart';

import '../views/agency/home_view.dart';

class HomeScreenAgency extends StatelessWidget {
  var height = 0.0, widht = 0.0;
  final int pageIndex;

  HomeScreenAgency({super.key, required this.pageIndex});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final colorScheme = theme.colorScheme;
    final backgroundColor = isDarkMode ? TColors.dark : colorScheme.primary;
    height = MediaQuery.of(context).size.height;
    widht = MediaQuery.of(context).size.width;
    final scaffolKey = GlobalKey<ScaffoldState>();
    final viewRouter = <Widget>[
      HomeView(height: height, widht: widht, titles: appMenuItem)
    ];

    return Scaffold(
      key: scaffolKey,
      appBar: AppBar(
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
        backgroundColor: backgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigations(currentPage: pageIndex),
      drawer: SideMenu(scaffolKey: scaffolKey),
      body: IndexedStack(
        index: pageIndex,
        children: viewRouter,
      ),
    );
  }

//
}
