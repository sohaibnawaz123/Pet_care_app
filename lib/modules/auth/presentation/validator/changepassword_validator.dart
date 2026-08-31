import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/validation_failure.dart';
import 'package:pet_care_app/core/validator/validator.dart';
import 'package:pet_care_app/modules/auth/domain/params/changepassword_param.dart';


class ChangepasswordValidator {
  Either<ValidationFailure, ChangepasswordParam> validate(ChangepasswordParam data) {
    if (Validator.validateEmail(data.email) != null) {
      return left(
        ValidationFailure(error: Validator.validateEmail(data.email)!),
      );
    }  else {
      return right(data);
    }
  }
}