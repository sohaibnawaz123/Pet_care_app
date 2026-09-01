import 'package:pet_care_app/modules/app/domain/entitties/user_role.dart';

class ForgetpasswordotpViewInitialParams {
  final UserRole? role;
  final String? email;
  const ForgetpasswordotpViewInitialParams({this.role, this.email});

  factory ForgetpasswordotpViewInitialParams.fromUri(Uri uri) {
    final roleValue = uri.queryParameters['role'];
    final emailValue = uri.queryParameters['email'];
    return ForgetpasswordotpViewInitialParams(
      role: roleValue == null ? null : userRoleFromJson(roleValue),
      email: emailValue ?? "",
      // Parse the URI parameters as needed
    );
  }

  factory ForgetpasswordotpViewInitialParams.fromExtra(Object? extra) {
    final role = extra is Map ? extra['role'] : null;
    final email = extra is Map ? extra['email'] : null;

    return ForgetpasswordotpViewInitialParams(
      role: role is UserRole ? role : null,
      email: email is String ? email : '',
    );
  }
}
