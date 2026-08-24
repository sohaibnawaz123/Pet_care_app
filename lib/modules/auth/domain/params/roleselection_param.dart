import 'package:pet_care_app/modules/auth/data/model/request/roleselection_request_model/roleselection_request_model.dart';

class RoleselectionParam {
  final String token;
  final String email;

  const RoleselectionParam({
    required this.token,
    required this.email,
  });

  RoleselectionRequestModel toModel() => RoleselectionRequestModel(
        token: token,
        email: email,
      );
}