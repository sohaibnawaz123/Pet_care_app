import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/roleselection_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/roleselection_param.dart';

abstract class RoleselectionRepo {
  Future<Either<RepoFailure, BaseEntity<RoleselectionEntity>>> 
      roleselection(
    RoleselectionParam param,
  );
}
