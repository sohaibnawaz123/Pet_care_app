import 'package:go_router/go_router.dart';
import 'package:pet_care_app/main.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/changepassword/changepassword_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/changepassword_view_initial_params.dart';
import 'package:pet_care_app/modules/auth/presentation/views/changepassword_view.dart';

class ChangepasswordRoute {
  static const String name = 'auth_changepassword';
  static const String path = '/auth/changepassword';

  static GoRoute get route => GoRoute(
    name: name,
    path: path,
    builder: (context, state) {
      final params = ChangepasswordViewInitialParams.fromUri(state.uri);
      final bloc = getIt<ChangepasswordBloc>(param1: params);

      return ChangepasswordView(bloc: bloc);
    },
  );
}
