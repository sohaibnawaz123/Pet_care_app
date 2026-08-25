import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/authselection_entity.dart';
import 'package:pet_care_app/modules/auth/domain/failures/authselection_failure.dart';
import 'package:pet_care_app/modules/auth/domain/params/authselection_param.dart';
import 'package:pet_care_app/modules/auth/domain/repository/authselection_repo.dart';

class AuthselectionUseCase {
  final AuthselectionRepo _repo;

  AuthselectionUseCase(this._repo);

  Future<
      Either<
          AuthselectionFailure,
          BaseEntity<AuthselectionEntity>>> execute(
    AuthselectionParam data,
  ) async {
    return await _repo.authselection(data).then(
          (value) => value.fold(
            (err) => left(
              AuthselectionFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
