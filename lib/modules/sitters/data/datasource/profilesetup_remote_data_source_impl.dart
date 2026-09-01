import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/constant/app_url.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/core/network/api_header.dart';
import 'package:pet_care_app/core/network/network_service.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/sitters/data/datasource/profilesetup_remote_data_source.dart';
import 'package:pet_care_app/modules/sitters/data/model/response/profilesetup_model/profilesetup_model.dart';
import 'package:pet_care_app/modules/sitters/domain/params/profilesetup_param.dart';

class ProfilesetupRemoteDataSourceImpl
    implements ProfilesetupRemoteDataSource {
  final NetworkService network;
  final AppUrl appUrl;

  ProfilesetupRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<ProfilesetupModel>>> 
      profilesetup(ProfilesetupParam data) =>
      network
          .post(
            AppUrl.profilesetupUrl,
             data.toModel().toJson(),
            ApiHeader.bearerHeaderOnly(data.token),
        // authType: AuthType.cookie,

          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<ProfilesetupModel>.fromJson(
                      response.data,
                          ProfilesetupModel.fromJson,
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
