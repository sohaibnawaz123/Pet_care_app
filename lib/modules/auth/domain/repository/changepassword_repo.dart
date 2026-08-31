import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/changepassword_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/changepassword_param.dart';

abstract class ChangepasswordRepo {
  Future<Either<RepoFailure, BaseEntity<ChangepasswordEntity>>> 
      changepassword(
    ChangepasswordParam param,
  );
}
