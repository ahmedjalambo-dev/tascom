import 'package:tascom/core/helpers/time_helper.dart';
import 'package:tascom/features/home/data/models/comment.dart';
import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_location.dart';
import 'package:tascom/features/home/data/models/task_metrics.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';
import 'package:tascom/features/home/data/models/task_status.dart';
import 'package:tascom/features/home/data/models/user_model.dart';

class TaskModel {
  final String id;
  final UserModel author;
  final DateTime createdAt;
  final String title;
  final String description;
  final TaskCategory category;
  final TaskPriority priority;
  final TaskStatus status;
  final TaskLocation location;
  final String duration;
  final TaskMetrics metrics;
  final int likeCount;
  final int commentCount;
  final List<Comment> comments;
  final String? imageUrl;
  final bool isClaimed;
  final bool isSaved;
  final UserModel? helper;
  final DateTime? cancelledAt;

  const TaskModel({
    required this.id,
    required this.author,
    required this.createdAt,
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    required this.status,
    required this.location,
    required this.duration,
    required this.metrics,
    required this.likeCount,
    required this.commentCount,
    this.comments = const [],
    this.imageUrl,
    this.isClaimed = false,
    this.isSaved = false,
    this.helper,
    this.cancelledAt,
  });

  String get timeAgo => calculateTimeAgo(createdAt);

  TaskModel copyWith({
    String? id,
    UserModel? author,
    DateTime? createdAt,
    String? title,
    String? description,
    TaskCategory? category,
    TaskPriority? priority,
    TaskStatus? status,
    TaskLocation? location,
    String? duration,
    TaskMetrics? metrics,
    int? likeCount,
    int? commentCount,
    List<Comment>? comments,
    String? imageUrl,
    bool? isClaimed,
    bool? isSaved,
    UserModel? helper,
    DateTime? cancelledAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      author: author ?? this.author,
      createdAt: createdAt ?? this.createdAt,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      location: location ?? this.location,
      duration: duration ?? this.duration,
      metrics: metrics ?? this.metrics,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      comments: comments ?? this.comments,
      imageUrl: imageUrl ?? this.imageUrl,
      isClaimed: isClaimed ?? this.isClaimed,
      isSaved: isSaved ?? this.isSaved,
      helper: helper ?? this.helper,
      cancelledAt: cancelledAt ?? this.cancelledAt,
    );
  }
}
