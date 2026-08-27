import 'package:pet_care_app/modules/app/domain/entitties/user_role.dart';

class RegisterViewInitialParams {
  final UserRole? role;
  const RegisterViewInitialParams({this.role});

  factory RegisterViewInitialParams.fromUri(Uri uri) {
    final roleValue = uri.queryParameters['role'];
    return RegisterViewInitialParams(
      role: roleValue == null ? null : userRoleFromJson(roleValue),
      // Parse the URI parameters as needed
    );
  }
}
