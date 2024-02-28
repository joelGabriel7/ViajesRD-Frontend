// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:viajes/presentation/widgets/bottom_navigations.dart';
import 'package:viajes/presentation/widgets/side_menu.dart';

import '../views/agency/home_view.dart';

class HomeScreenAgency extends StatelessWidget {
  var height = 0.0, widht = 0.0;

  List titles = ['Excursions', 'Reservations', 'Clients', 'Tourist places'];
  HomeScreenAgency({super.key});
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    widht = MediaQuery.of(context).size.width;
    final scaffolKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        bottomNavigationBar: const BottomNavigations(),
        drawer: SideMenu(scaffolKey: scaffolKey),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: HomeView(height: height, widht: widht, titles: titles),
        ));
  }

//
}
