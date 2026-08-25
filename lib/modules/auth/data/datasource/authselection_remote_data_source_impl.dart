import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/network/network_service.dart';

import 'package:pet_care_app/core/constant/app_url.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/core/network/api_header.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/auth/data/datasource/authselection_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/data/model/response/authselection_model/authselection_model.dart';
import 'package:pet_care_app/modules/auth/domain/params/authselection_param.dart';

class AuthselectionRemoteDataSourceImpl
    implements AuthselectionRemoteDataSource {
  final NetworkService network;
  final AppUrl appUrl;

  AuthselectionRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<AuthselectionModel>>> 
      authselection(AuthselectionParam data) =>
      network
          .get(
            AppUrl.authselectionUrl,
            ApiHeader.bearerHeaderOnly(data.token),
            query: data.toModel().toJson(),
        // authType: AuthType.cookie,
          )
          .then(
            (value) => value.fold(
              (l) => left(RepoFailure(error: l.error)),
              (response) {
                try {
                  return right(
                    BaseJson<AuthselectionModel>.fromJson(
                      response.data,
                          AuthselectionModel.fromJson,
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
