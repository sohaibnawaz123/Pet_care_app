import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/constant/app_url.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/core/network/api_header.dart';
import 'package:pet_care_app/core/network/network_service.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/auth/data/datasource/register_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/data/model/response/register_model/register_model.dart';
import 'package:pet_care_app/modules/auth/domain/params/register_param.dart';

class RegisterRemoteDataSourceImpl
    implements RegisterRemoteDataSource {
  final NetworkService network;
  final AppUrl appUrl;

  RegisterRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<RegisterModel>>> 
      register(RegisterParam data) =>
      network
          .post(
            AppUrl.registerUrl,
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
                    BaseJson<RegisterModel>.fromJson(
                      response.data,
                          RegisterModel.fromJson,
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
