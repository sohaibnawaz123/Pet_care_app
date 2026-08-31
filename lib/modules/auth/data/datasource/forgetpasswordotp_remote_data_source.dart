import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/auth/data/model/response/forgetpasswordotp_model/forgetpasswordotp_model.dart';
import 'package:pet_care_app/modules/auth/domain/params/forgetpasswordotp_param.dart';
abstract class ForgetpasswordotpRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<ForgetpasswordotpModel>>> forgetpasswordotp(ForgetpasswordotpParam data);

}

