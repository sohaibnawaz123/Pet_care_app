import 'package:pet_care_app/modules/sitters/domain/entities/profilesetup_entity.dart';

class ProfilesetupModel {
  String? userMessage;
  bool? status;

  ProfilesetupModel({
    this.userMessage,
    this.status,
  });

  factory ProfilesetupModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      ProfilesetupModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  ProfilesetupEntity toEntity() {
    return ProfilesetupEntity(
      userMessage: userMessage ?? '',
      status: status ?? false,
    );
  }
}
