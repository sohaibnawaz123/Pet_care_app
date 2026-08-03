import 'package:go_router/go_router.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';
import 'package:pet_care_app/routes/home_page.dart';

class HomeRoute {
  static const String name = 'home';
  static const String path = AppRoutePaths.home;

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (context, state) => const HomePage(title: 'Flutter Demo Home Page'),
  );
}
