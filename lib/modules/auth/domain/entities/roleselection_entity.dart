class RoleselectionEntity {
  final String userMessage;
  final bool status;

  RoleselectionEntity({
    required this.userMessage,
    required this.status,
  });

  RoleselectionEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return RoleselectionEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
