import 'package:pet_care_app/modules/auth/domain/entities/roleselection_entity.dart';

class RoleselectionModel {
  String? userMessage;
  bool? status;

  RoleselectionModel({
    this.userMessage,
    this.status,
  });

  factory RoleselectionModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      RoleselectionModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  RoleselectionEntity toEntity() {
    return RoleselectionEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
