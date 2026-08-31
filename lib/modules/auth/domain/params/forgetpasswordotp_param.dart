import 'package:pet_care_app/modules/auth/data/model/request/forgetpasswordotp_request_model/forgetpasswordotp_request_model.dart';

class ForgetpasswordotpParam {
  final String token;
  final String email;

  const ForgetpasswordotpParam({
    required this.token,
    required this.email,
  });

  ForgetpasswordotpRequestModel toModel() => ForgetpasswordotpRequestModel(
        token: token,
        email: email,
      );
}