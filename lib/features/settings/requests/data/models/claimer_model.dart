class ClaimerModel {
  final String id;
  final String name;
  final String? avatarUrl;
  final int tasksCompleted;
  final double rating;
  final String message;
  final DateTime claimedAt;

  const ClaimerModel({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.tasksCompleted,
    required this.rating,
    required this.message,
    required this.claimedAt,
  });
}
