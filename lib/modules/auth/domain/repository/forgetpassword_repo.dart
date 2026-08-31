import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/forgetpassword_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/forgetpassword_param.dart';

abstract class ForgetpasswordRepo {
  Future<Either<RepoFailure, BaseEntity<ForgetpasswordEntity>>> 
      forgetpassword(
    ForgetpasswordParam param,
  );
}
