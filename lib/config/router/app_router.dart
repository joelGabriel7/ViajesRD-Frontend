import 'package:go_router/go_router.dart';
import 'package:viajes/config/helpers/auth/common_widget.dart';
import 'package:viajes/presentation/screens/Tourists%20Places/tourist_place_created_screen.dart';
import 'package:viajes/presentation/screens/agency_profile.dart';
import 'package:viajes/presentation/screens/auth/login.dart';
import 'package:viajes/presentation/screens/auth/onboarding_screen.dart';
import 'package:viajes/presentation/screens/auth/signup_screen.dart';
import 'package:viajes/presentation/screens/auth/success_account_created.dart';
import 'package:viajes/presentation/screens/auth/success_login.dart';
import 'package:viajes/presentation/screens/category_screen.dart';
import 'package:viajes/presentation/screens/client/cart_screen.dart';
import 'package:viajes/presentation/screens/client/excursions.dart';
import 'package:viajes/presentation/screens/client/home_screen_client.dart';
import 'package:viajes/presentation/screens/client/place_screen.dart';
import 'package:viajes/presentation/screens/clientes_screen.dart';
import 'package:viajes/presentation/screens/excursions_screen.dart';
import 'package:viajes/presentation/screens/home_screen_agency.dart';
import 'package:viajes/presentation/screens/reservations_screen.dart';
import 'package:viajes/presentation/screens/Tourists%20Places/details/tourist_place_details.dart';
import 'package:viajes/presentation/screens/Tourists%20Places/tourist_place_screen.dart';
import 'package:viajes/presentation/widgets/succes_agency_profile.dart';

import '../../presentation/views/agency/form/agency_form_view.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const RedirectWidget(),
  ),
  GoRoute(
    path: '/onboarding',
    builder: (context, state) => const OnBoardingScreen(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: '/succes/account',
    builder: (context, state) => const SuccessAccountCreated(),
  ),
  GoRoute(
    path: '/success/login',
    builder: (context, state) => const SuccessLoginScreen(),
  ),
  GoRoute(
      path: '/home/client/:page',
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
        return HomeScreenClient(pageIndex: pageIndex);
      },
      routes: [
        GoRoute(
            path: 'place/:id',
            builder: (context, state) {
              final String isId = state.pathParameters['id'] ?? 'no-id';
              final int id = int.parse(isId);
              return PlaceScreen(placeId: id);
            }),
        GoRoute(
            path: 'excursion/:id',
            builder: (context, state) {
              final String isId = state.pathParameters['id'] ?? 'no-id';
              final int id = int.parse(isId);
              return ExcursionScreen(excursionId: id);
            }),
        GoRoute(
            path: 'cart/item', builder: (context, state) => const CartScreen()),
      ]),
  GoRoute(
    path: '/home/:page',
    builder: (context, state) {
      final pageIndex = int.parse(state.pathParameters['page'] ?? '0');
      return HomeScreenAgency(pageIndex: pageIndex);
    },
  ),
  GoRoute(
    path: '/agency/new',
    builder: (context, state) {
      final userData =
          state.extra as Map<String, dynamic>?; // Recupera los datos pasados
      return AgencyFormView(
          userData: userData); // Pasa los datos al constructor
    },
  ),
  GoRoute(
    path: '/agency/profile',
    builder: (context, state) => const AgencyProfile(),
  ),
  GoRoute(
    path: '/agency/profile/success',
    builder: (context, state) => const SuccesAgencyProfile(),
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
