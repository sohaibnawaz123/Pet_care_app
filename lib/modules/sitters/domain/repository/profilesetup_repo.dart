import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/sitters/domain/entities/profilesetup_entity.dart';
import 'package:pet_care_app/modules/sitters/domain/params/profilesetup_param.dart';

abstract class ProfilesetupRepo {
  Future<Either<RepoFailure, BaseEntity<ProfilesetupEntity>>> 
      profilesetup(
    ProfilesetupParam param,
  );
}
