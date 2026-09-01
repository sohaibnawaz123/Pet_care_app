import 'package:go_router/go_router.dart';
import 'package:pet_care_app/main.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/forgetpassword/forgetpassword_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/forgetpassword_view_initial_params.dart';
import 'package:pet_care_app/modules/auth/presentation/views/forgetpassword_view.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class ForgetpasswordRoute {
  static const String name = AppRouteNames.forgetpassword;
  static const String path = AppRoutePaths.forgetpassword;

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (context, state) {
      final params = ForgetpasswordViewInitialParams.fromExtra(state.extra);
      final bloc = getIt<ForgetpasswordBloc>(param1: params);

      return ForgetpasswordView(bloc: bloc);
    },
  );
}
