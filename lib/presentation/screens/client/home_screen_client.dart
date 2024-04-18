import 'package:flutter/material.dart';
import 'package:viajes/presentation/views/clients/excursion_view_client.dart';
import 'package:viajes/presentation/views/clients/home_view_client.dart';
import 'package:viajes/presentation/views/clients/settings_view_client.dart';
import 'package:viajes/presentation/views/clients/tourist_place_client_view.dart';
import 'package:viajes/presentation/widgets/client/bottom_navigations.dart';

class HomeScreenClient extends StatelessWidget {
  final int pageIndex;
  const HomeScreenClient({super.key, required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationsClient(currentPage: pageIndex),
      body: IndexedStack(
        index: pageIndex,
        children: [
          const HomeViewClient(),
          const TouristPlaceClientView(),
          const ExcursionViewClient(),
          const SettingsViewClient(),
        ],
      ),
    );
  }
}
