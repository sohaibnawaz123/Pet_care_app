import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/auth/data/model/response/roleselection_model/roleselection_model.dart';
import 'package:pet_care_app/modules/auth/domain/params/roleselection_param.dart';
abstract class RoleselectionRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<RoleselectionModel>>> roleselection(RoleselectionParam data);

}

