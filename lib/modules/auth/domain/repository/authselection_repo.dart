import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/authselection_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/authselection_param.dart';

abstract class AuthselectionRepo {
  Future<Either<RepoFailure, BaseEntity<AuthselectionEntity>>> 
      authselection(
    AuthselectionParam param,
  );
}
