import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/changepassword_entity.dart';
import 'package:pet_care_app/modules/auth/domain/failures/changepassword_failure.dart';
import 'package:pet_care_app/modules/auth/domain/params/changepassword_param.dart';
import 'package:pet_care_app/modules/auth/domain/repository/changepassword_repo.dart';
import 'package:pet_care_app/modules/auth/presentation/validator/changepassword_validator.dart';

class ChangepasswordUseCase {
  final ChangepasswordValidator validator;
  final ChangepasswordRepo _repo;

  ChangepasswordUseCase(this.validator, this._repo);

  Future<
      Either<
          ChangepasswordFailure,
          BaseEntity<ChangepasswordEntity>>> execute(
    ChangepasswordParam data,
  ) async {
    return validator
        .validate(data)
        .fold(
          (l) => left(ChangepasswordFailure(error: l.error)),
          (r) async => await _repo.changepassword(data).then(
          (value) => value.fold(
            (err) => left(
              ChangepasswordFailure(error: err.error),
            ),
            (response) => right(response),
          )),
        );
  }
}

