import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/auth/data/datasource/changepassword_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/domain/entities/changepassword_entity.dart';
import 'package:pet_care_app/modules/auth/domain/params/changepassword_param.dart';
import 'package:pet_care_app/modules/auth/domain/repository/changepassword_repo.dart';

class ChangepasswordRestApiRepo implements ChangepasswordRepo {
  final ChangepasswordRemoteDataSource _dataSource;

  ChangepasswordRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<ChangepasswordEntity>>> 
      changepassword(
    ChangepasswordParam param,
  ) =>
      _dataSource.changepassword(param).then(
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
