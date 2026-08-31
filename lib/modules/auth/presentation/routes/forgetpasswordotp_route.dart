import 'package:go_router/go_router.dart';
import 'package:pet_care_app/main.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/forgetpasswordotp/forgetpasswordotp_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/forgetpasswordotp_view_initial_params.dart';
import 'package:pet_care_app/modules/auth/presentation/views/forgetpasswordotp_view.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class ForgetpasswordotpRoute {
  static const String name = AppRouteNames.forgetpasswordotp;
  static const String path = AppRoutePaths.forgetpasswordotp;

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (context, state) {
      final params = ForgetpasswordotpViewInitialParams.fromUri(state.uri);
      final bloc = getIt<ForgetpasswordotpBloc>(param1: params);

      return ForgetpasswordotpView(bloc: bloc);
    },
  );
}
