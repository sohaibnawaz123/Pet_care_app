import 'package:pet_care_app/modules/auth/domain/entities/changepassword_entity.dart';

class ChangepasswordModel {
  String? userMessage;
  bool? status;

  ChangepasswordModel({
    this.userMessage,
    this.status,
  });

  factory ChangepasswordModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ChangepasswordModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  ChangepasswordEntity toEntity() {
    return ChangepasswordEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
