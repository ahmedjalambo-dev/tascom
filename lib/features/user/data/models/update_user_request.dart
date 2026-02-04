import 'dart:io';

class UpdateUserRequest {
  final String? name;
  final String? email;
  final String? location;
  final String? phoneNumber;
  final String? about;
  final List<String>? skills;
  final DateTime? dateOfBirth;
  final String? gender;
  final File? avatarFile;

  UpdateUserRequest({
    this.name,
    this.email,
    this.location,
    this.phoneNumber,
    this.about,
    this.skills,
    this.dateOfBirth,
    this.gender,
    this.avatarFile,
  });

  /// Check if any field has data
  bool get hasData =>
      name != null ||
      email != null ||
      location != null ||
      phoneNumber != null ||
      about != null ||
      skills != null ||
      dateOfBirth != null ||
      gender != null ||
      avatarFile != null;
}
