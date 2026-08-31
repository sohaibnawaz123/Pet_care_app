import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/domain/entities/forgetpasswordotp_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/forgetpasswordotp_param.dart';

abstract class ForgetpasswordotpRepo {
  Future<Either<RepoFailure, BaseEntity<ForgetpasswordotpEntity>>> 
      forgetpasswordotp(
    ForgetpasswordotpParam param,
  );
}
