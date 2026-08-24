import 'package:go_router/go_router.dart';
import 'package:pet_care_app/main.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/roleselection/roleselection_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/roleselection_view_initial_params.dart';
import 'package:pet_care_app/modules/auth/presentation/views/roleselection_view.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class RoleselectionRoute {
  static const String name = AppRoutePaths.roleselection;
  static const String path = AppRoutePaths.roleselection;

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (context, state) {
      final params = RoleselectionViewInitialParams.fromUri(state.uri);
      final bloc = getIt<RoleselectionBloc>(param1: params);

      return RoleselectionView(bloc: bloc);
    },
  );
}
