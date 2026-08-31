import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/data/datasource/forgetpasswordotp_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/domain/entities/forgetpasswordotp_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/forgetpasswordotp_param.dart';
import 'package:pet_care_app/modules/auth/domain/repository/forgetpasswordotp_repo.dart';

class ForgetpasswordotpRestApiRepo implements ForgetpasswordotpRepo {
  final ForgetpasswordotpRemoteDataSource _dataSource;

  ForgetpasswordotpRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<ForgetpasswordotpEntity>>> 
      forgetpasswordotp(
    ForgetpasswordotpParam param,
  ) =>
      _dataSource.forgetpasswordotp(param).then(
        (value) => value.fold(
          (l) => left(RepoFailure(error: l.error)),
          (response) {
            try {
              return right(
                response.toDomain(
                  (val) => val!.toEntity(),
                ),
              );
            } catch (e) {
              return left(RepoFailure(error: e.toString()));
            }
          },
        ),
      );
}
