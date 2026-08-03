import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/network/auth_type.dart';
import 'package:pet_care_app/core/network/network_response.dart';

import '../failures/network_failure.dart';

abstract class Network {
  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> get(
    String url,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType,
  });

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> post(
    String url,
    Map<String, dynamic> data,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType,
  });

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> patch(
    String url,
    Map<String, dynamic> data,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType,
  });

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> put(
    String url,
    Map<String, dynamic> data,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType,
  });

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> postFile(
    String url,
    Map<String, dynamic> data,
    Map<String, dynamic> file,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType,
  });

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> patchFile(
    String url,
    Map<String, dynamic> data,
    Map<String, dynamic> file,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType,
  });

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> putFile(
    String url,
    Map<String, dynamic> data,
    Map<String, dynamic> file,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType,
  });

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> putBinary(
    String url,
    String filePath,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType,
  });

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> delete(
    String url,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType,
  });
}
