import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/data/datasource/roleselection_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/domain/entities/roleselection_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/roleselection_param.dart';
import 'package:pet_care_app/modules/auth/domain/repository/roleselection_repo.dart';

class RoleselectionRestApiRepo implements RoleselectionRepo {
  final RoleselectionRemoteDataSource _dataSource;

  RoleselectionRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<RoleselectionEntity>>> 
      roleselection(
    RoleselectionParam param,
  ) =>
      _dataSource.roleselection(param).then(
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
