import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/sitters/data/model/response/profilesetup_model/profilesetup_model.dart';
import 'package:pet_care_app/modules/sitters/domain/params/profilesetup_param.dart';
abstract class ProfilesetupRemoteDataSource {
    Future<Either<RepoFailure, BaseJson<ProfilesetupModel>>> profilesetup(ProfilesetupParam data);

}

