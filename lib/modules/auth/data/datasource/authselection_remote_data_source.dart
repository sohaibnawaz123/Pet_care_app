import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/auth/data/model/response/authselection_model/authselection_model.dart';
import 'package:pet_care_app/modules/auth/domain/params/authselection_param.dart';
abstract class AuthselectionRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<AuthselectionModel>>> authselection(AuthselectionParam data);

}

