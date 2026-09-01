import 'package:go_router/go_router.dart';
import 'package:pet_care_app/main.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/authselection/authselection_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/authselection_view_initial_params.dart';
import 'package:pet_care_app/modules/auth/presentation/views/authselection_view.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class AuthselectionRoute {
  static const String name = AppRouteNames.authselection;
  static const String path = AppRoutePaths.authselection;

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (context, state) {
      final params = AuthselectionViewInitialParams.fromExtra(state.extra);
      final bloc = getIt<AuthselectionBloc>(param1: params);

      return AuthselectionView(bloc: bloc);
    },
  );
}
