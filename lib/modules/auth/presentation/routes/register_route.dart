import 'package:go_router/go_router.dart';
import 'package:pet_care_app/main.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/register/register_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/register_view_initial_params.dart';
import 'package:pet_care_app/modules/auth/presentation/views/register_view.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class RegisterRoute {
  static const String name = AppRouteNames.register;
  static const String path = AppRoutePaths.register;

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (context, state) {
      final params = RegisterViewInitialParams.fromUri(state.uri);
      final bloc = getIt<RegisterBloc>(param1: params);

      return RegisterView(bloc: bloc);
    },
  );
}
