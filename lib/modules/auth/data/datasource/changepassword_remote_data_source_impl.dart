import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/constant/app_url.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/core/network/api_header.dart';
import 'package:pet_care_app/core/network/network_service.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/auth/data/datasource/changepassword_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/data/model/response/changepassword_model/changepassword_model.dart';
import 'package:pet_care_app/modules/auth/domain/params/changepassword_param.dart';

class ChangepasswordRemoteDataSourceImpl
    implements ChangepasswordRemoteDataSource {
  final NetworkService network;
  final AppUrl appUrl;

  ChangepasswordRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<ChangepasswordModel>>> 
      changepassword(ChangepasswordParam data) =>
      network
          .post(
            AppUrl.changepasswordUrl,
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
                    BaseJson<ChangepasswordModel>.fromJson(
                      response.data,
                          ChangepasswordModel.fromJson,
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
