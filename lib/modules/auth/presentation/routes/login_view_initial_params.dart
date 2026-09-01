import 'package:pet_care_app/modules/app/domain/entitties/user_role.dart';

class LoginViewInitialParams {
  final UserRole? role;
  const LoginViewInitialParams({this.role});

  factory LoginViewInitialParams.fromUri(Uri uri) {
    final roleValue = uri.queryParameters['role'];
    return LoginViewInitialParams(
      role: roleValue == null ? null : userRoleFromJson(roleValue),
      // Parse the URI parameters as needed
    );
  }

  factory LoginViewInitialParams.fromExtra(Object? extra) {
    final role = extra is Map ? extra['role'] : null;

    return LoginViewInitialParams(role: role is UserRole ? role : null);
  }
}
