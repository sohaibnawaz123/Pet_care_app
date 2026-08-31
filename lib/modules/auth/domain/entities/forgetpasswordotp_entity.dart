class ForgetpasswordotpEntity {
  final String userMessage;
  final bool status;

  ForgetpasswordotpEntity({
    required this.userMessage,
    required this.status,
  });

  ForgetpasswordotpEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return ForgetpasswordotpEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
