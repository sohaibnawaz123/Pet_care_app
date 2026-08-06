enum UserRole {
  admin,
  doctor,
  petOwner,
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
    default:
      return UserRole.unknown;
  }
}
