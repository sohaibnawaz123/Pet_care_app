import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/auth/data/model/response/changepassword_model/changepassword_model.dart';
import 'package:pet_care_app/modules/auth/domain/params/changepassword_param.dart';
abstract class ChangepasswordRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<ChangepasswordModel>>> changepassword(ChangepasswordParam data);

}

