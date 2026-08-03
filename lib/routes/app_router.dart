import 'package:go_router/go_router.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';
import 'package:pet_care_app/routes/app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutePaths.login,
    routes: appRoutes,
  );
}
