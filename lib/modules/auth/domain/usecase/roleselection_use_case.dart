import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/roleselection_entity.dart';
import 'package:pet_care_app/modules/auth/domain/failures/roleselection_failure.dart';
import 'package:pet_care_app/modules/auth/domain/params/roleselection_param.dart';
import 'package:pet_care_app/modules/auth/domain/repository/roleselection_repo.dart';

class RoleselectionUseCase {
  final RoleselectionRepo _repo;

  RoleselectionUseCase(this._repo);

  Future<
      Either<
          RoleselectionFailure,
          BaseEntity<RoleselectionEntity>>> execute(
    RoleselectionParam data,
  ) async {
    return await _repo.roleselection(data).then(
          (value) => value.fold(
            (err) => left(
              RoleselectionFailure(error: err.error),
            ),
            (response) => right(response),
          ),
        );
  }
}
