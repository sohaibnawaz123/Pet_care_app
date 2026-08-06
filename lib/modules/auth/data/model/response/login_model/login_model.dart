import 'package:pet_care_app/modules/app/domain/entitties/user_role.dart';
import 'package:pet_care_app/modules/auth/domain/entities/login_entity.dart';

class LoginModel {
  String? userMessage;
  bool? status;
  dynamic role;

  LoginModel({
    this.userMessage,
    this.status,
    this.role,
  });

  factory LoginModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      LoginModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
        role: json['role'],
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
        'role': role,
      };

  LoginEntity toEntity() {
    return LoginEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
      role: userRoleFromJson(role),
    );
  }
}
