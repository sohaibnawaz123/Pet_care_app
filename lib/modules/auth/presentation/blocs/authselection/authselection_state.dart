part of 'authselection_bloc.dart';

class AuthselectionState extends Equatable {
  final AuthselectionViewInitialParams initialParams;
  final ApiResponse<BaseEntity<AuthselectionEntity>> authselectionResponse;

  const AuthselectionState({
    required this.initialParams,
    this.authselectionResponse = const ApiResponse.init(),
  });

   AuthselectionState copyWith({
    AuthselectionViewInitialParams? initialParams,
    ApiResponse<BaseEntity<AuthselectionEntity>>? authselectionResponse,
  }) {
    AuthselectionState data =   AuthselectionState(
      initialParams: initialParams ?? this.initialParams,
      authselectionResponse: authselectionResponse ?? this.authselectionResponse,
    );
    Utils.logInfo(data.toString(), name: "Authselection");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, authselectionResponse];

  @override
  String toString() {
    return 'AuthselectionState(initialParams: $initialParams, authselectionResponse: ${authselectionResponse.toString()})';
  }
}
