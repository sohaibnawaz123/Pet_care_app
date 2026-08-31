import 'package:go_router/go_router.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/login_route.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/roleselection_route.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/authselection_route.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/register_route.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/forgetpassword_route.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/forgetpasswordotp_route.dart';


final List<RouteBase> appRoutes = <RouteBase>[
  RoleselectionRoute.route,
  AuthselectionRoute.route,
  LoginRoute.route,
  RegisterRoute.route,
  ForgetpasswordRoute.route,
  ForgetpasswordotpRoute.route,
];
