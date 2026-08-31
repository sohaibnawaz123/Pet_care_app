import 'package:pet_care_app/modules/auth/domain/entities/forgetpasswordotp_entity.dart';

class ForgetpasswordotpModel {
  String? userMessage;
  bool? status;

  ForgetpasswordotpModel({
    this.userMessage,
    this.status,
  });

  factory ForgetpasswordotpModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ForgetpasswordotpModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  ForgetpasswordotpEntity toEntity() {
    return ForgetpasswordotpEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
