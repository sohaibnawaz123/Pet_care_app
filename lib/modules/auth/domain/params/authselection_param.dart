import 'package:pet_care_app/modules/auth/data/model/request/authselection_request_model/authselection_request_model.dart';

class AuthselectionParam {
  final String token;
  final String email;

  const AuthselectionParam({
    required this.token,
    required this.email,
  });

  AuthselectionRequestModel toModel() => AuthselectionRequestModel(
        token: token,
        email: email,
      );
}