
class TaskModel {
  final String id;
  final String title;
  final String timeAgo;
  final String status; // Active, In Progress, Completed, Canceled
  final String? applicantsCount;
  final String? helperName;
  final String category;
  final String location;
  final String? distance;
  final bool isPostedByMe;
  final String? posterName; // الشخص الذي نشر المهمة أصلاً

  TaskModel({
    required this.id,
    required this.title,
    required this.timeAgo,
    required this.status,
    this.applicantsCount,
    this.helperName,
    required this.category,
    required this.location,
    this.distance,
    required this.isPostedByMe,
    this.posterName,
  });
}
