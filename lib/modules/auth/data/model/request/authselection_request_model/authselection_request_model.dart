
import 'package:pet_care_app/modules/auth/domain/params/authselection_param.dart';

class AuthselectionRequestModel extends AuthselectionParam {
  const AuthselectionRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}