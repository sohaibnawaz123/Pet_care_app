import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/network_failure.dart';
import 'package:pet_care_app/core/network/network_response.dart';

abstract class AuthRepo {
  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> refreshToken();
}
