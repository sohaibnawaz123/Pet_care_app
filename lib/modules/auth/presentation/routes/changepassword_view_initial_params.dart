import 'package:pet_care_app/modules/app/domain/entitties/user_role.dart';

class ChangepasswordViewInitialParams {
  final UserRole? role;
  const ChangepasswordViewInitialParams({this.role});

  factory ChangepasswordViewInitialParams.fromUri(Uri uri) {
    return ChangepasswordViewInitialParams(
      // Parse the URI parameters as needed
    );
  }

  factory ChangepasswordViewInitialParams.fromExtra(Object? extra) {
    final role = extra is Map ? extra['role'] : null;

    return ChangepasswordViewInitialParams(role: role is UserRole ? role : null);
  }
}