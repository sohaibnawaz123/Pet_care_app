import 'package:pet_care_app/modules/app/domain/entitties/user_role.dart';

class LoginEntity {
  final String userMessage;
  final bool status;
  final UserRole role;

  LoginEntity({
    required this.userMessage,
    required this.status,
    required this.role,
  });

  LoginEntity copyWith({
    String? userMessage,
    bool? status,
    UserRole? role,
  }) {
    return LoginEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
      role: role ?? this.role,
    );
  }
}
