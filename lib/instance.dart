import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_care_app/main.dart';
import 'package:pet_care_app/core/constant/app_url.dart';
import 'package:pet_care_app/core/network/network_service.dart';

import 'package:pet_care_app/modules/auth/data/datasource/roleselection_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/data/datasource/roleselection_remote_data_source_impl.dart';
import 'package:pet_care_app/modules/auth/data/rest_api/roleselection_rest_api_repo.dart';
import 'package:pet_care_app/modules/auth/domain/repository/roleselection_repo.dart';
import 'package:pet_care_app/modules/auth/domain/usecase/roleselection_use_case.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/roleselection/roleselection_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/roleselection_view_initial_params.dart';

import 'package:pet_care_app/modules/auth/data/datasource/authselection_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/data/datasource/authselection_remote_data_source_impl.dart';
import 'package:pet_care_app/modules/auth/data/rest_api/authselection_rest_api_repo.dart';
import 'package:pet_care_app/modules/auth/domain/repository/authselection_repo.dart';
import 'package:pet_care_app/modules/auth/domain/usecase/authselection_use_case.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/authselection/authselection_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/authselection_view_initial_params.dart';

import 'package:pet_care_app/modules/auth/data/datasource/login_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/data/datasource/login_remote_data_source_impl.dart';
import 'package:pet_care_app/modules/auth/data/rest_api/login_rest_api_repo.dart';
import 'package:pet_care_app/modules/auth/domain/repository/login_repo.dart';
import 'package:pet_care_app/modules/auth/domain/usecase/login_use_case.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/login/login_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/login_view_initial_params.dart';
import 'package:pet_care_app/modules/auth/presentation/validator/login_validator.dart';

import 'package:pet_care_app/modules/auth/data/datasource/register_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/data/datasource/register_remote_data_source_impl.dart';
import 'package:pet_care_app/modules/auth/data/rest_api/register_rest_api_repo.dart';
import 'package:pet_care_app/modules/auth/domain/repository/register_repo.dart';
import 'package:pet_care_app/modules/auth/domain/usecase/register_use_case.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/register/register_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/register_view_initial_params.dart';
import 'package:pet_care_app/modules/auth/presentation/validator/register_validator.dart';

import 'package:pet_care_app/modules/auth/data/datasource/forgetpassword_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/data/datasource/forgetpassword_remote_data_source_impl.dart';
import 'package:pet_care_app/modules/auth/data/rest_api/forgetpassword_rest_api_repo.dart';
import 'package:pet_care_app/modules/auth/domain/repository/forgetpassword_repo.dart';
import 'package:pet_care_app/modules/auth/domain/usecase/forgetpassword_use_case.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/forgetpassword/forgetpassword_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/forgetpassword_view_initial_params.dart';
import 'package:pet_care_app/modules/auth/presentation/validator/forgetpassword_validator.dart';

import 'package:pet_care_app/modules/auth/data/datasource/forgetpasswordotp_remote_data_source.dart';
import 'package:pet_care_app/modules/auth/data/datasource/forgetpasswordotp_remote_data_source_impl.dart';
import 'package:pet_care_app/modules/auth/data/rest_api/forgetpasswordotp_rest_api_repo.dart';
import 'package:pet_care_app/modules/auth/domain/repository/forgetpasswordotp_repo.dart';
import 'package:pet_care_app/modules/auth/domain/usecase/forgetpasswordotp_use_case.dart';
import 'package:pet_care_app/modules/auth/presentation/blocs/forgetpasswordotp/forgetpasswordotp_bloc.dart';
import 'package:pet_care_app/modules/auth/presentation/routes/forgetpasswordotp_view_initial_params.dart';
import 'package:pet_care_app/modules/auth/presentation/validator/forgetpasswordotp_validator.dart';

void getInstance(BuildContext context) {
  getIt = GetIt.instance;
  if (!getIt.isRegistered<NetworkService>()) {
    getIt.registerSingleton<NetworkService>(NetworkService());
  }
  if (!getIt.isRegistered<AppUrl>()) {
    getIt.registerSingleton<AppUrl>(AppUrl());
  }

  // <<<<<<<<<<<<<<<<<<<<<<<  Roleselection  >>>>>>>>>>>>>>>>>>>>>>>
  if (!getIt.isRegistered<RoleselectionRemoteDataSource>()) {
    getIt.registerSingleton<RoleselectionRemoteDataSource>(
      RoleselectionRemoteDataSourceImpl(getIt(), getIt()),
    );
  }

  if (!getIt.isRegistered<RoleselectionRepo>()) {
    getIt.registerSingleton<RoleselectionRepo>(
      RoleselectionRestApiRepo(getIt()),
    );
  }

  if (!getIt.isRegistered<RoleselectionUseCase>()) {
    getIt.registerSingleton<RoleselectionUseCase>(
      RoleselectionUseCase(getIt()),
    );
  }

  if (!getIt.isRegistered<RoleselectionBloc>()) {
    getIt.registerFactoryParam<
      RoleselectionBloc,
      RoleselectionViewInitialParams,
      dynamic
    >((params, _) => RoleselectionBloc(params, getIt()));
  }

  // <<<<<<<<<<<<<<<<<<<<<<<  Authselection  >>>>>>>>>>>>>>>>>>>>>>>
  if (!getIt.isRegistered<AuthselectionRemoteDataSource>()) {
    getIt.registerSingleton<AuthselectionRemoteDataSource>(
      AuthselectionRemoteDataSourceImpl(getIt(), getIt()),
    );
  }

  if (!getIt.isRegistered<AuthselectionRepo>()) {
    getIt.registerSingleton<AuthselectionRepo>(
      AuthselectionRestApiRepo(getIt()),
    );
  }

  if (!getIt.isRegistered<AuthselectionUseCase>()) {
    getIt.registerSingleton<AuthselectionUseCase>(
      AuthselectionUseCase(getIt()),
    );
  }

  if (!getIt.isRegistered<AuthselectionBloc>()) {
    getIt.registerFactoryParam<
      AuthselectionBloc,
      AuthselectionViewInitialParams,
      dynamic
    >((params, _) => AuthselectionBloc(params, getIt()));
  }

  // <<<<<<<<<<<<<<<<<<<<<<<  Login  >>>>>>>>>>>>>>>>>>>>>>>
  if (!getIt.isRegistered<LoginRemoteDataSource>()) {
    getIt.registerSingleton<LoginRemoteDataSource>(
      LoginRemoteDataSourceImpl(getIt(), getIt()),
    );
  }

  if (!getIt.isRegistered<LoginValidator>()) {
    getIt.registerSingleton<LoginValidator>(LoginValidator());
  }

  if (!getIt.isRegistered<LoginRepo>()) {
    getIt.registerSingleton<LoginRepo>(LoginRestApiRepo(getIt()));
  }

  if (!getIt.isRegistered<LoginUseCase>()) {
    getIt.registerSingleton<LoginUseCase>(LoginUseCase(getIt(), getIt()));
  }

  if (!getIt.isRegistered<LoginBloc>()) {
    getIt.registerFactoryParam<LoginBloc, LoginViewInitialParams, dynamic>(
      (params, _) => LoginBloc(params, getIt()),
    );
  }

  // <<<<<<<<<<<<<<<<<<<<<<<  Register  >>>>>>>>>>>>>>>>>>>>>>>
  if (!getIt.isRegistered<RegisterRemoteDataSource>()) {
    getIt.registerSingleton<RegisterRemoteDataSource>(
      RegisterRemoteDataSourceImpl(getIt(), getIt()),
    );
  }

  if (!getIt.isRegistered<RegisterValidator>()) {
    getIt.registerSingleton<RegisterValidator>(RegisterValidator());
  }

  if (!getIt.isRegistered<RegisterRepo>()) {
    getIt.registerSingleton<RegisterRepo>(RegisterRestApiRepo(getIt()));
  }

  if (!getIt.isRegistered<RegisterUseCase>()) {
    getIt.registerSingleton<RegisterUseCase>(RegisterUseCase(getIt(), getIt()));
  }

  if (!getIt.isRegistered<RegisterBloc>()) {
    getIt
        .registerFactoryParam<RegisterBloc, RegisterViewInitialParams, dynamic>(
          (params, _) => RegisterBloc(params, getIt()),
        );
  }

  // <<<<<<<<<<<<<<<<<<<<<<<  Forgetpassword  >>>>>>>>>>>>>>>>>>>>>>>
  if (!getIt.isRegistered<ForgetpasswordRemoteDataSource>()) {
    getIt.registerSingleton<ForgetpasswordRemoteDataSource>(
      ForgetpasswordRemoteDataSourceImpl(getIt(), getIt()),
    );
  }

  if (!getIt.isRegistered<ForgetpasswordValidator>()) {
    getIt.registerSingleton<ForgetpasswordValidator>(ForgetpasswordValidator());
  }

  if (!getIt.isRegistered<ForgetpasswordRepo>()) {
    getIt.registerSingleton<ForgetpasswordRepo>(
      ForgetpasswordRestApiRepo(getIt()),
    );
  }

  if (!getIt.isRegistered<ForgetpasswordUseCase>()) {
    getIt.registerSingleton<ForgetpasswordUseCase>(
      ForgetpasswordUseCase(getIt(), getIt()),
    );
  }

  if (!getIt.isRegistered<ForgetpasswordBloc>()) {
    getIt.registerFactoryParam<
      ForgetpasswordBloc,
      ForgetpasswordViewInitialParams,
      dynamic
    >((params, _) => ForgetpasswordBloc(params, getIt()));
  }

  // <<<<<<<<<<<<<<<<<<<<<<<  Forgetpasswordotp  >>>>>>>>>>>>>>>>>>>>>>>
  if (!getIt.isRegistered<ForgetpasswordotpRemoteDataSource>()) {
    getIt.registerSingleton<ForgetpasswordotpRemoteDataSource>(
      ForgetpasswordotpRemoteDataSourceImpl(getIt(), getIt()),
    );
  }

  if (!getIt.isRegistered<ForgetpasswordotpValidator>()) {
    getIt.registerSingleton<ForgetpasswordotpValidator>(
      ForgetpasswordotpValidator(),
    );
  }

  if (!getIt.isRegistered<ForgetpasswordotpRepo>()) {
    getIt.registerSingleton<ForgetpasswordotpRepo>(
      ForgetpasswordotpRestApiRepo(getIt()),
    );
  }

  if (!getIt.isRegistered<ForgetpasswordotpUseCase>()) {
    getIt.registerSingleton<ForgetpasswordotpUseCase>(
      ForgetpasswordotpUseCase(getIt(), getIt()),
    );
  }

  if (!getIt.isRegistered<ForgetpasswordotpBloc>()) {
    getIt.registerFactoryParam<
      ForgetpasswordotpBloc,
      ForgetpasswordotpViewInitialParams,
      dynamic
    >((params, _) => ForgetpasswordotpBloc(params, getIt()));
  }
}
