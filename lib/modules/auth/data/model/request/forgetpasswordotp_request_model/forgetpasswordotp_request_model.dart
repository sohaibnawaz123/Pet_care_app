
import 'package:pet_care_app/modules/auth/domain/params/forgetpasswordotp_param.dart';

class ForgetpasswordotpRequestModel extends ForgetpasswordotpParam {
  const ForgetpasswordotpRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}