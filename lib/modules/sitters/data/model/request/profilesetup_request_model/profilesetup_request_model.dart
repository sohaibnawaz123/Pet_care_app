
import 'package:pet_care_app/modules/sitters/domain/params/profilesetup_param.dart';

class ProfilesetupRequestModel extends ProfilesetupParam {
  const ProfilesetupRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}