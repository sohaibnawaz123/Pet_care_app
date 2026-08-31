part of 'forgetpasswordotp_bloc.dart';

class ForgetpasswordotpState extends Equatable {
  final ForgetpasswordotpViewInitialParams initialParams;
  final ApiResponse<BaseEntity<ForgetpasswordotpEntity>> forgetpasswordotpResponse;

  const ForgetpasswordotpState({
    required this.initialParams,
    this.forgetpasswordotpResponse = const ApiResponse.init(),
  });

   ForgetpasswordotpState copyWith({
    ForgetpasswordotpViewInitialParams? initialParams,
    ApiResponse<BaseEntity<ForgetpasswordotpEntity>>? forgetpasswordotpResponse,
  }) {
    ForgetpasswordotpState data =   ForgetpasswordotpState(
      initialParams: initialParams ?? this.initialParams,
      forgetpasswordotpResponse: forgetpasswordotpResponse ?? this.forgetpasswordotpResponse,
    );
    Utils.logInfo(data.toString(), name: "Forgetpasswordotp");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, forgetpasswordotpResponse];

  @override
  String toString() {
    return 'ForgetpasswordotpState(initialParams: $initialParams, forgetpasswordotpResponse: ${forgetpasswordotpResponse.toString()})';
  }
}
