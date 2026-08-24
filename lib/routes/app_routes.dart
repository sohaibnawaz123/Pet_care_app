import 'package:go_router/go_router.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/login_route.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/roleselection_route.dart';

final List<RouteBase> appRoutes = <RouteBase>[
  RoleselectionRoute.route,
  LoginRoute.route,
];
