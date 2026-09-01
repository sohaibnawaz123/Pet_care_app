import 'package:pet_care_app/modules/app/domain/entitties/user_role.dart';

class AuthselectionViewInitialParams {
  final UserRole? role;
  const AuthselectionViewInitialParams({this.role});

  factory AuthselectionViewInitialParams.fromUri(Uri uri) {
    final roleValue = uri.queryParameters['role'];

    return AuthselectionViewInitialParams(
      role: roleValue == null ? null : userRoleFromJson(roleValue),
    );
  }

  factory AuthselectionViewInitialParams.fromExtra(Object? extra) {
    final role = extra is Map ? extra['role'] : null;

    return AuthselectionViewInitialParams(role: role is UserRole ? role : null);
  }
}
