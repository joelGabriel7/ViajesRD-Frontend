import 'package:go_router/go_router.dart';
import 'package:viajes/presentation/screens/clientes_screen.dart';
import 'package:viajes/presentation/screens/excursions_screen.dart';
import 'package:viajes/presentation/screens/home_screen_agency.dart';
import 'package:viajes/presentation/screens/reservations_screen.dart';
import 'package:viajes/presentation/screens/tourist_place_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => HomeScreenAgency(),
  ),
  GoRoute(
    path: '/excursions',
    builder: (context, state) => const ExcursionsScreen(),
  ),
  GoRoute(
    path: '/reservations',
    name: ReservationsScreen.name,
    builder: (context, state) => const ReservationsScreen(),
  ),
  GoRoute(
    path: '/clients',
    builder: (context, state) => const ClientsScreen(),
  ),
  GoRoute(
    path: '/touristplaces',
    builder: (context, state) => const TouristPlaceScreen(),
  ),
]);
