part of 'profilesetup_bloc.dart';

class ProfilesetupState extends Equatable {
  final ProfilesetupViewInitialParams initialParams;
  final ApiResponse<BaseEntity<ProfilesetupEntity>> profilesetupResponse;

  const ProfilesetupState({
    required this.initialParams,
    this.profilesetupResponse = const ApiResponse.init(),
  });

   ProfilesetupState copyWith({
    ProfilesetupViewInitialParams? initialParams,
    ApiResponse<BaseEntity<ProfilesetupEntity>>? profilesetupResponse,
  }) {
    ProfilesetupState data =   ProfilesetupState(
      initialParams: initialParams ?? this.initialParams,
      profilesetupResponse: profilesetupResponse ?? this.profilesetupResponse,
    );
    Utils.logInfo(data.toString(), name: "Profilesetup");
    return data;
  }

 @override
  List<Object?> get props => [initialParams, profilesetupResponse];

  @override
  String toString() {
    return 'ProfilesetupState(initialParams: $initialParams, profilesetupResponse: ${profilesetupResponse.toString()})';
  }
}
