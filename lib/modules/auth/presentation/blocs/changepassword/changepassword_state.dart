part of 'changepassword_bloc.dart';

class ChangepasswordState extends Equatable {
  final ChangepasswordViewInitialParams initialParams;
  final ApiResponse<BaseEntity<ChangepasswordEntity>> changepasswordResponse;

  const ChangepasswordState({
    required this.initialParams,
    this.changepasswordResponse = const ApiResponse.init(),
  });

   ChangepasswordState copyWith({
    ChangepasswordViewInitialParams? initialParams,
    ApiResponse<BaseEntity<ChangepasswordEntity>>? changepasswordResponse,
  }) {
    ChangepasswordState data =   ChangepasswordState(
      initialParams: initialParams ?? this.initialParams,
      changepasswordResponse: changepasswordResponse ?? this.changepasswordResponse,
    );
    Utils.logInfo(data.toString(), name: "Changepassword");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, changepasswordResponse];

  @override
  String toString() {
    return 'ChangepasswordState(initialParams: $initialParams, changepasswordResponse: ${changepasswordResponse.toString()})';
  }
}
