import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/repo_failure.dart';
import 'package:pet_care_app/modules/app/domain/entitties/base_entity.dart';
import 'package:pet_care_app/modules/sitters/data/datasource/profilesetup_remote_data_source.dart';
import 'package:pet_care_app/modules/sitters/domain/entities/profilesetup_entity.dart';
import 'package:pet_care_app/modules/sitters/domain/params/profilesetup_param.dart';
import 'package:pet_care_app/modules/sitters/domain/repository/profilesetup_repo.dart';

class ProfilesetupRestApiRepo implements ProfilesetupRepo {
  final ProfilesetupRemoteDataSource _dataSource;

  ProfilesetupRestApiRepo(this._dataSource);

  @override
  Future<Either<RepoFailure, BaseEntity<ProfilesetupEntity>>> 
      profilesetup(
    ProfilesetupParam param,
  ) =>
      _dataSource.profilesetup(param).then(
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
