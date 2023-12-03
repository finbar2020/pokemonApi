import 'package:go_router/go_router.dart';
import 'package:pokemon_api/src/presentation/pages/details/details_page.dart';
import 'package:pokemon_api/src/presentation/pages/error/error_page.dart';
import 'package:pokemon_api/src/presentation/pages/home/home_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (_, state) => const HomePage(),
    ),
    GoRoute(
      path: '/details/:id',
      builder: (_, state) => DetailsPage(id: state.pathParameters['id']!),
    ),
  ],
  errorBuilder: (_, state) => const ErrorPage(),
);
