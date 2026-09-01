import 'package:pet_care_app/modules/app/domain/entitties/user_role.dart';

class ForgetpasswordViewInitialParams {
  final UserRole? role;
  const ForgetpasswordViewInitialParams({this.role});

  factory ForgetpasswordViewInitialParams.fromUri(Uri uri) {
    final roleValue = uri.queryParameters['role'];
    return ForgetpasswordViewInitialParams(
      role: roleValue == null ? null : userRoleFromJson(roleValue),
      // Parse the URI parameters as needed
    );
  }

  factory ForgetpasswordViewInitialParams.fromExtra(Object? extra) {
    final role = extra is Map ? extra['role'] : null;

    return ForgetpasswordViewInitialParams(
      role: role is UserRole ? role : null,
    );
  }
}
