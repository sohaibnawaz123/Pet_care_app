class ChangepasswordEntity {
  final String userMessage;
  final bool status;

  ChangepasswordEntity({
    required this.userMessage,
    required this.status,
  });

  ChangepasswordEntity copyWith({
    String? userMessage,
    bool? status,
  }) {
    return ChangepasswordEntity(
      userMessage: userMessage ?? this.userMessage,
      status: status ?? this.status,
    );
  }
}
