import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/constant/app_url.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/core/network/api_header.dart';
import 'package:pet_care_app/core/network/network_service.dart';
import 'package:pet_care_app/modules/app/data/models/base_json.dart';
import 'package:pet_care_app/modules/auth/data/datasource/forgetpasswordotp_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/data/model/response/forgetpasswordotp_model/forgetpasswordotp_model.dart';
import 'package:pet_care_app/modules/auth/domain/params/forgetpasswordotp_param.dart';

class ForgetpasswordotpRemoteDataSourceImpl
    implements ForgetpasswordotpRemoteDataSource {
  final NetworkService network;
  final AppUrl appUrl;

  ForgetpasswordotpRemoteDataSourceImpl(
    this.network,
    this.appUrl,
  );

  @override
  Future<Either<RepoFailure, BaseJson<ForgetpasswordotpModel>>> 
      forgetpasswordotp(ForgetpasswordotpParam data) =>
      network
          .post(
            AppUrl.forgetpasswordotpUrl,
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
                    BaseJson<ForgetpasswordotpModel>.fromJson(
                      response.data,
                          ForgetpasswordotpModel.fromJson,
                    ),
                  );
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              },
            ),
          );
}
