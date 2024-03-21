import 'package:go_router/go_router.dart';
import 'package:viajes/presentation/screens/Tourists%20Places/tourist_place_created_screen.dart';
import 'package:viajes/presentation/screens/auth/onboarding_screen.dart';
import 'package:viajes/presentation/screens/category_screen.dart';
import 'package:viajes/presentation/screens/clientes_screen.dart';
import 'package:viajes/presentation/screens/excursions_screen.dart';
import 'package:viajes/presentation/screens/home_screen_agency.dart';
import 'package:viajes/presentation/screens/reservations_screen.dart';
import 'package:viajes/presentation/screens/Tourists%20Places/details/tourist_place_details.dart';
import 'package:viajes/presentation/screens/Tourists%20Places/tourist_place_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const OnBoardingScreen(),
  ),
  GoRoute(
    path: '/home',
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
  GoRoute(
      path: '/touristplaces/:id',
      builder: (context, state) {
        final String isId = state.pathParameters['id']!;
        final int id = int.parse(isId);
        return TouristPlaceDetailsScreen(placeId: id);
      }),
  GoRoute(
    path: '/new/touristplaces',
    builder: (context, state) => const TouristPlacesCreateScreen(),
  ),
  GoRoute(
    path: '/edit/touristplaces/:id',
    builder: (context, state) {
      final String isId = state.pathParameters['id']!;
      final int id = int.parse(isId);
      return TouristPlacesCreateScreen(
        touristPlace: id,
      );
    },
  ),
  GoRoute(
    path: '/categories',
    builder: (context, state) => const CategoryScreen(),
  ),
]);
