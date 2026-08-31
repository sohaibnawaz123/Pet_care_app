
import 'package:pet_care_app/modules/auth/domain/params/changepassword_param.dart';

class ChangepasswordRequestModel extends ChangepasswordParam {
  const ChangepasswordRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}