import 'package:fpdart/fpdart.dart';
import 'package:pet_care_app/core/failures/network_failure.dart';
import 'package:pet_care_app/core/network/auth_type.dart';
import 'package:pet_care_app/core/network/network.dart';
import 'package:pet_care_app/core/network/network_response.dart';
import 'package:pet_care_app/core/network/session_invalidation_handler.dart';
import 'package:pet_care_app/core/utils/utils.dart';
import 'package:pet_care_app/domain/repository/auth_repo.dart';

class NetworkHandler {
  final Network network;
  final AuthRepo authRepo;
  final SessionInvalidationHandler sessionInvalidationHandler;

  NetworkHandler(this.network, this.authRepo, this.sessionInvalidationHandler);

  Future<void> _logout() => sessionInvalidationHandler.invalidateSession();

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> get(
    String url,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType = AuthType.none,
  }) async {
    final result = await network.get(
      url,
      header,
      query: query,
      pathVariable: pathVariable,
      authType: authType,
    );
    return result.fold(
      (l) => _handleTokenRefreshAndRetry(
        (updatedHeader) => network.get(
          url,
          updatedHeader,
          query: query,
          pathVariable: pathVariable,
          authType: authType,
        ),
        l,
        header,
        authType,
      ),
      (response) async => right(response),
    );
  }

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> post(
    String url,
    Map<String, dynamic> data,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType = AuthType.none,
  }) async {
    final result = await network.post(
      url,
      data,
      header,
      query: query,
      pathVariable: pathVariable,
      authType: authType,
    );
    return result.fold(
      (l) => _handleTokenRefreshAndRetry(
        (updatedHeader) => network.post(
          url,
          data,
          updatedHeader,
          query: query,
          pathVariable: pathVariable,
          authType: authType,
        ),
        l,
        header,
        authType,
      ),
      (response) async => right(response),
    );
  }

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> patch(
    String url,
    Map<String, dynamic> data,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType = AuthType.none,
  }) async {
    final result = await network.patch(
      url,
      data,
      header,
      query: query,
      pathVariable: pathVariable,
      authType: authType,
    );
    return result.fold(
      (l) => _handleTokenRefreshAndRetry(
        (updatedHeader) => network.patch(
          url,
          data,
          updatedHeader,
          query: query,
          pathVariable: pathVariable,
          authType: authType,
        ),
        l,
        header,
        authType,
      ),
      (response) async => right(response),
    );
  }

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> put(
    String url,
    Map<String, dynamic> data,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType = AuthType.none,
  }) async {
    final result = await network.put(
      url,
      data,
      header,
      query: query,
      pathVariable: pathVariable,
      authType: authType,
    );
    return result.fold(
      (l) => _handleTokenRefreshAndRetry(
        (updatedHeader) => network.put(
          url,
          data,
          updatedHeader,
          query: query,
          pathVariable: pathVariable,
          authType: authType,
        ),
        l,
        header,
        authType,
      ),
      (response) async => right(response),
    );
  }

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> postFile(
    String url,
    Map<String, dynamic> data,
    Map<String, dynamic> file,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType = AuthType.none,
  }) async {
    final result = await network.postFile(
      url,
      data,
      file,
      header,
      query: query,
      pathVariable: pathVariable,
      authType: authType,
    );
    return result.fold(
      (l) => _handleTokenRefreshAndRetry(
        (updatedHeader) => network.postFile(
          url,
          data,
          file,
          updatedHeader,
          query: query,
          pathVariable: pathVariable,
          authType: authType,
        ),
        l,
        header,
        authType,
      ),
      (response) async => right(response),
    );
  }

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> patchFile(
    String url,
    Map<String, dynamic> data,
    Map<String, dynamic> file,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType = AuthType.none,
  }) async {
    final result = await network.patchFile(
      url,
      data,
      file,
      header,
      query: query,
      pathVariable: pathVariable,
      authType: authType,
    );
    return result.fold(
      (l) => _handleTokenRefreshAndRetry(
        (updatedHeader) => network.patchFile(
          url,
          data,
          file,
          updatedHeader,
          query: query,
          pathVariable: pathVariable,
          authType: authType,
        ),
        l,
        header,
        authType,
      ),
      (response) async => right(response),
    );
  }

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> putFile(
    String url,
    Map<String, dynamic> data,
    Map<String, dynamic> file,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType = AuthType.none,
  }) async {
    final result = await network.putFile(
      url,
      data,
      file,
      header,
      query: query,
      pathVariable: pathVariable,
      authType: authType,
    );
    return result.fold(
      (l) => _handleTokenRefreshAndRetry(
        (updatedHeader) => network.putFile(
          url,
          data,
          file,
          updatedHeader,
          query: query,
          pathVariable: pathVariable,
          authType: authType,
        ),
        l,
        header,
        authType,
      ),
      (response) async => right(response),
    );
  }

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> putBinary(
    String url,
    String filePath,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType = AuthType.none,
  }) async {
    final result = await network.putBinary(
      url,
      filePath,
      header,
      query: query,
      pathVariable: pathVariable,
      authType: authType,
    );
    return result.fold(
      (l) => _handleTokenRefreshAndRetry(
        (updatedHeader) => network.putBinary(
          url,
          filePath,
          updatedHeader,
          query: query,
          pathVariable: pathVariable,
          authType: authType,
        ),
        l,
        header,
        authType,
      ),
      (response) async => right(response),
    );
  }

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>> delete(
    String url,
    Map<String, String>? header, {
    Map<String, dynamic>? query,
    String? pathVariable,
    AuthType? authType = AuthType.none,
  }) async {
    final result = await network.delete(
      url,
      header,
      query: query,
      pathVariable: pathVariable,
      authType: authType,
    );
    return result.fold(
      (l) => _handleTokenRefreshAndRetry(
        (updatedHeader) => network.delete(
          url,
          updatedHeader,
          query: query,
          pathVariable: pathVariable,
          authType: authType,
        ),
        l,
        header,
        authType,
      ),
      (response) async => right(response),
    );
  }

  Future<Either<NetworkFailure, NetworkResponse<dynamic>>>
  _handleTokenRefreshAndRetry(
    Future<Either<NetworkFailure, NetworkResponse<dynamic>>> Function(
      Map<String, String>? header,
    )
    request,
    NetworkFailure failure,
    Map<String, String>? header,
    AuthType? authType,
  ) async {
    if ((failure is UnAuthorizedFailure) &&
        (authType == AuthType.cookie || authType == AuthType.refreshCookie)) {
      final refreshResult = await authRepo.refreshToken();

      return refreshResult.fold(
        (error) async {
          Utils.logError(
            'Logout because token refresh failed 1: ${error.error}, msg: ${error.message}',
          );

          if (error.message == 'Unauthorized') {
            await _logout();
          }
          return left(NetworkFailure(error.error, error.message));
        },
        (refreshData) async {
          final retryResult = await request(header);
          return retryResult.fold((err) async {
            if (err is UnAuthorizedFailure) {
              Utils.logError(
                'Logout because token refresh failed 2: ${err.error}',
              );
              await _logout();
            }
            return left(NetworkFailure(err.error, err.message));
          }, (v) => right(v));
        },
      );
    } else {
      return left(NetworkFailure(failure.error.toString(), failure.message));
    }
  }
}
