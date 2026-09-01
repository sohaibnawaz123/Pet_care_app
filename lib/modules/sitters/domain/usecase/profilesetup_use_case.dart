import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/sitters/domain/entities/profilesetup_entity.dart';
import 'package:pet_care_app/modules/sitters/domain/failures/profilesetup_failure.dart';
import 'package:pet_care_app/modules/sitters/domain/params/profilesetup_param.dart';
import 'package:pet_care_app/modules/sitters/domain/repository/profilesetup_repo.dart';
import 'package:pet_care_app/modules/sitters/presentation/validator/profilesetup_validator.dart';

class ProfilesetupUseCase {
  final ProfilesetupValidator validator;
  final ProfilesetupRepo _repo;

  ProfilesetupUseCase(this.validator, this._repo);

  Future<
      Either<
          ProfilesetupFailure,
          BaseEntity<ProfilesetupEntity>>> execute(
    ProfilesetupParam data,
  ) async {
    return validator
        .validate(data)
        .fold(
          (l) => left(ProfilesetupFailure(error: l.error)),
          (r) async => await _repo.profilesetup(data).then(
          (value) => value.fold(
            (err) => left(
              ProfilesetupFailure(error: err.error),
            ),
            (response) => right(response),
          )),
        );
  }
}

