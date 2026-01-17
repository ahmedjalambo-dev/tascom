/// Priority levels for tasks.
enum TaskPriority {
  high,
  medium,
  low,
}

/// Model representing a task/post in the home feed.
class TaskModel {
  final String id;
  final String title;
  final String description;
  final String authorName;
  final String? authorAvatar;
  final double authorRating;
  final DateTime createdAt;
  final String category;
  final TaskPriority priority;
  final String location;
  final String duration;
  final int points;
  final String? imageUrl;
  final int likesCount;
  final int commentsCount;
  final bool isLiked;
  final bool isBookmarked;

  const TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.authorName,
    this.authorAvatar,
    required this.authorRating,
    required this.createdAt,
    required this.category,
    required this.priority,
    required this.location,
    required this.duration,
    required this.points,
    this.imageUrl,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.isLiked = false,
    this.isBookmarked = false,
  });

  /// Creates a copy of this task with the given fields replaced.
  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    String? authorName,
    String? authorAvatar,
    double? authorRating,
    DateTime? createdAt,
    String? category,
    TaskPriority? priority,
    String? location,
    String? duration,
    int? points,
    String? imageUrl,
    int? likesCount,
    int? commentsCount,
    bool? isLiked,
    bool? isBookmarked,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      authorName: authorName ?? this.authorName,
      authorAvatar: authorAvatar ?? this.authorAvatar,
      authorRating: authorRating ?? this.authorRating,
      createdAt: createdAt ?? this.createdAt,
      category: category ?? this.category,
      priority: priority ?? this.priority,
      location: location ?? this.location,
      duration: duration ?? this.duration,
      points: points ?? this.points,
      imageUrl: imageUrl ?? this.imageUrl,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
