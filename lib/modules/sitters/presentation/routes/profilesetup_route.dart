import 'package:go_router/go_router.dart';
import 'package:pet_care_app/main.dart';
import 'package:pet_care_app/modules/sitters/presentation/blocs/profilesetup/profilesetup_bloc.dart';
import 'package:pet_care_app/modules/sitters/presentation/routes/profilesetup_view_initial_params.dart';
import 'package:pet_care_app/modules/sitters/presentation/views/profilesetup_view.dart';
import 'package:pet_care_app/routes/app_route_paths.dart';

class ProfilesetupRoute {
  static const String name = AppRouteNames.sittersProfileSetup;
  static const String path = AppRoutePaths.sittersProfileSetup;

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (context, state) {
      final params = ProfilesetupViewInitialParams.fromUri(state.uri);
      final bloc = getIt<ProfilesetupBloc>(param1: params);

      return ProfilesetupView(bloc: bloc);
    },
  );
}
