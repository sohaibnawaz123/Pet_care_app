import 'package:go_router/go_router.dart';
import 'package:pet_care_app/main.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/login_view_initial_params.dart';
import 'package:pet_care_app/modules/auth/presentation/views/login_view.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class LoginRoute {
  static const String name = 'auth_login';
  static const String path = AppRoutePaths.login;

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (context, state) {
      final params = LoginViewInitialParams.fromUri(state.uri);
      final bloc = getIt<LoginBloc>(param1: params);

      return LoginView(bloc: bloc);
    },
  );
}
