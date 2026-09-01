import 'package:pet_care_app/modules/sitters/data/model/request/profilesetup_request_model/profilesetup_request_model.dart';

class ProfilesetupParam {
  final String token;
  final String email;

  const ProfilesetupParam({
    required this.token,
    required this.email,
  });

  ProfilesetupRequestModel toModel() => ProfilesetupRequestModel(
        token: token,
        email: email,
      );
}