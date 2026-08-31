import 'package:pet_care_app/modules/auth/data/model/request/changepassword_request_model/changepassword_request_model.dart';

class ChangepasswordParam {
  final String token;
  final String email;

  const ChangepasswordParam({
    required this.token,
    required this.email,
  });

  ChangepasswordRequestModel toModel() => ChangepasswordRequestModel(
        token: token,
        email: email,
      );
}