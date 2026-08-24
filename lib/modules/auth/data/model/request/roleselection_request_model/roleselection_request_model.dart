
import 'package:pet_care_app/modules/auth/domain/params/roleselection_param.dart';

class RoleselectionRequestModel extends RoleselectionParam {
  const RoleselectionRequestModel({
    required super.token,
    required super.email,
  });

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
      };
}