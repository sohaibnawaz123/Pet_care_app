import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/forgetpasswordotp_entity.dart';
import 'package:pet_care_app/modules/auth/domain/failures/forgetpasswordotp_failure.dart';
import 'package:pet_care_app/modules/auth/domain/params/forgetpasswordotp_param.dart';
import 'package:pet_care_app/modules/auth/domain/repository/forgetpasswordotp_repo.dart';
import 'package:pet_care_app/modules/auth/presentation/validator/forgetpasswordotp_validator.dart';

class ForgetpasswordotpUseCase {
  final ForgetpasswordotpValidator validator;
  final ForgetpasswordotpRepo _repo;

  ForgetpasswordotpUseCase(this.validator, this._repo);

  Future<
      Either<
          ForgetpasswordotpFailure,
          BaseEntity<ForgetpasswordotpEntity>>> execute(
    ForgetpasswordotpParam data,
  ) async {
    return validator
        .validate(data)
        .fold(
          (l) => left(ForgetpasswordotpFailure(error: l.error)),
          (r) async => await _repo.forgetpasswordotp(data).then(
          (value) => value.fold(
            (err) => left(
              ForgetpasswordotpFailure(error: err.error),
            ),
            (response) => right(response),
          )),
        );
  }
}

