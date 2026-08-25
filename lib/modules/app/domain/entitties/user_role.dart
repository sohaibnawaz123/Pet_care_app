enum UserRole {
  admin,
  doctor,
  petOwner,
  petSitter,
  unknown,
}

extension UserRoleX on UserRole {
  String get value {
    switch (this) {
      case UserRole.admin:
        return 'admin';
      case UserRole.doctor:
        return 'doctor';
      case UserRole.petOwner:
        return 'petOwner';
      case UserRole.petSitter:
        return 'petSitter';
      case UserRole.unknown:
        return 'unknown';
    }
  }
}

UserRole userRoleFromJson(dynamic value) {
  final normalized = value?.toString().trim().toLowerCase();

  switch (normalized) {
    case 'admin':
      return UserRole.admin;
    case 'doctor':
      return UserRole.doctor;
    case 'petowner':
    case 'pet_owner':
    case 'pet-owner':
      return UserRole.petOwner;
    case 'petsitter':
    case 'pet_sitter':
    case 'pet-sitter':
      return UserRole.petSitter;
    default:
      return UserRole.unknown;
  }
}
