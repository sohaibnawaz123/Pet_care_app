import 'package:pet_care_app/modules/auth/domain/entities/authselection_entity.dart';

class AuthselectionModel {
  String? userMessage;
  bool? status;

  AuthselectionModel({
    this.userMessage,
    this.status,
  });

  factory AuthselectionModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      AuthselectionModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  AuthselectionEntity toEntity() {
    return AuthselectionEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
