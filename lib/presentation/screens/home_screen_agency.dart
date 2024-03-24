// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:viajes/config/menu/menu_item.dart';
import 'package:viajes/presentation/views/agency/profile_agency_view.dart';
import 'package:viajes/presentation/widgets/bottom_navigations.dart';

import '../views/agency/home_view.dart';

class HomeScreenAgency extends StatelessWidget {
  var height = 0.0, widht = 0.0;
  final int pageIndex;

  HomeScreenAgency({super.key, required this.pageIndex});
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    widht = MediaQuery.of(context).size.width;

    final viewRouter = <Widget>[
      HomeView(height: height, widht: widht, titles: appMenuItem),
      const ProfileAgencyView()
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigations(currentPage: pageIndex),
      body: IndexedStack(
        index: pageIndex,
        children: viewRouter,
      ),
    );
  }

//
}
