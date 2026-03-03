class UserModel {
  final String id;
  final String name;
  final String? avatar;
  final double rating;

  const UserModel({
    required this.id,
    required this.name,
    this.avatar,
    required this.rating,
  });
}
