class AuthselectionEntity {
  final String userMessage;
  final bool status;

  AuthselectionEntity({
    required this.userMessage,
    required this.status,
  });

  AuthselectionEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return AuthselectionEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
