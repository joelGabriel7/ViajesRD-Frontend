// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../views/agency/home_view.dart';

class HomeScreenAgency extends StatelessWidget {
  var height, widht;

  List titles = ['Excursions', 'Reservations', 'Clients', 'Tourist places'];
  HomeScreenAgency({super.key});
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    widht = MediaQuery.of(context).size.width;
    return HomeView(height: height, widht: widht, titles: titles);
  }

//
}
