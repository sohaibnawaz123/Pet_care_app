import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/network/network_service.dart';

import 'package:pet_care_app/core/constant/app_url.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/core/network/api_header.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/auth/data/datasource/roleselection_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/data/model/response/roleselection_model/roleselection_model.dart';
import 'package:pet_care_app/modules/auth/domain/params/roleselection_param.dart';

class RoleselectionRemoteDataSourceImpl
    implements RoleselectionRemoteDataSource {
  final NetworkService network;
  final AppUrl appUrl;

  RoleselectionRemoteDataSourceImpl(this.network, this.appUrl);

  @override
  Future<Either<RepoFailure, BaseJson<RoleselectionModel>>> roleselection(
    RoleselectionParam data,
  ) => network
      .get(
        AppUrl.roleselectionUrl,
        ApiHeader.bearerHeaderOnly(data.token),
        query: data.toModel().toJson(),
        // authType: AuthType.cookie,
      )
      .then(
        (value) =>
            value.fold((l) => left(RepoFailure(error: l.error)), (response) {
              try {
                return right(
                  BaseJson<RoleselectionModel>.fromJson(
                    response.data,
                    RoleselectionModel.fromJson,
                  ),
                );
              } catch (e) {
                return left(RepoFailure(error: e.toString()));
              }
            }),
      );
}
