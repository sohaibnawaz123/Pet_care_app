class ProfilesetupEntity {
  final String userMessage;
  final bool status;

  ProfilesetupEntity({
    required this.userMessage,
    required this.status,
  });

  ProfilesetupEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return ProfilesetupEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
