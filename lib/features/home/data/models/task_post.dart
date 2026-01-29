import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';

class TaskPost {
  final String id;
  final String userName;
  final String? userAvatar;
  final double userRating;
  final String timeAgo;
  final String title;
  final String description;
  final TaskCategory category;
  final TaskPriority priority;
  final String location;
  final String duration;
  final int points;
  final int likeCount;
  final int commentCount;
  final String? imageUrl;

  const TaskPost({
    required this.id,
    required this.userName,
    this.userAvatar,
    required this.userRating,
    required this.timeAgo,
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    required this.location,
    required this.duration,
    required this.points,
    required this.likeCount,
    required this.commentCount,
    this.imageUrl,
  });
}
