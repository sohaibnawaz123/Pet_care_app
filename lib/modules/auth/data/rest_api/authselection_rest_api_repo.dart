import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/data/datasource/authselection_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/domain/entities/authselection_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/authselection_param.dart';
import 'package:pet_care_app/modules/auth/domain/repository/authselection_repo.dart';

class AuthselectionRestApiRepo implements AuthselectionRepo {
  final AuthselectionRemoteDataSource _dataSource;

  AuthselectionRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<AuthselectionEntity>>> 
      authselection(
    AuthselectionParam param,
  ) =>
      _dataSource.authselection(param).then(
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
