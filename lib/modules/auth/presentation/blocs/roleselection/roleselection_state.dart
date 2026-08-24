part of 'roleselection_bloc.dart';

class RoleselectionState extends Equatable {
  final RoleselectionViewInitialParams initialParams;
  final ApiResponse<BaseEntity<RoleselectionEntity>> roleselectionResponse;

  const RoleselectionState({
    required this.initialParams,
    this.roleselectionResponse = const ApiResponse.init(),
  });

   RoleselectionState copyWith({
    RoleselectionViewInitialParams? initialParams,
    ApiResponse<BaseEntity<RoleselectionEntity>>? roleselectionResponse,
  }) {
    RoleselectionState data =   RoleselectionState(
      initialParams: initialParams ?? this.initialParams,
      roleselectionResponse: roleselectionResponse ?? this.roleselectionResponse,
    );
    Utils.logInfo(data.toString(), name: "Roleselection");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, roleselectionResponse];

  @override
  String toString() {
    return 'RoleselectionState(initialParams: $initialParams, roleselectionResponse: ${roleselectionResponse.toString()})';
  }
}
