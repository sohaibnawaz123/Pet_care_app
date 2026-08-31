import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/auth/data/model/response/forgetpassword_model/forgetpassword_model.dart';
import 'package:pet_care_app/modules/auth/domain/params/forgetpassword_param.dart';
abstract class ForgetpasswordRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<ForgetpasswordModel>>> forgetpassword(ForgetpasswordParam data);

}

