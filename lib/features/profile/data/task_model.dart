/// Model representing a task in the profile feature.
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
  final String? posterName;

  const TaskModel({
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

  /// Creates a copy of this task with the given fields replaced with new values.
  TaskModel copyWith({
    String? id,
    String? title,
    String? timeAgo,
    String? status,
    String? applicantsCount,
    String? helperName,
    String? category,
    String? location,
    String? distance,
    bool? isPostedByMe,
    String? posterName,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      timeAgo: timeAgo ?? this.timeAgo,
      status: status ?? this.status,
      applicantsCount: applicantsCount ?? this.applicantsCount,
      helperName: helperName ?? this.helperName,
      category: category ?? this.category,
      location: location ?? this.location,
      distance: distance ?? this.distance,
      isPostedByMe: isPostedByMe ?? this.isPostedByMe,
      posterName: posterName ?? this.posterName,
    );
  }

  /// Creates a TaskModel from a JSON map.
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as String,
      title: json['title'] as String,
      timeAgo: json['timeAgo'] as String,
      status: json['status'] as String,
      applicantsCount: json['applicantsCount'] as String?,
      helperName: json['helperName'] as String?,
      category: json['category'] as String,
      location: json['location'] as String,
      distance: json['distance'] as String?,
      isPostedByMe: json['isPostedByMe'] as bool,
      posterName: json['posterName'] as String?,
    );
  }

  /// Converts this TaskModel to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'timeAgo': timeAgo,
      'status': status,
      'applicantsCount': applicantsCount,
      'helperName': helperName,
      'category': category,
      'location': location,
      'distance': distance,
      'isPostedByMe': isPostedByMe,
      'posterName': posterName,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel &&
        other.id == id &&
        other.title == title &&
        other.timeAgo == timeAgo &&
        other.status == status &&
        other.applicantsCount == applicantsCount &&
        other.helperName == helperName &&
        other.category == category &&
        other.location == location &&
        other.distance == distance &&
        other.isPostedByMe == isPostedByMe &&
        other.posterName == posterName;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      title,
      timeAgo,
      status,
      applicantsCount,
      helperName,
      category,
      location,
      distance,
      isPostedByMe,
      posterName,
    );
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, timeAgo: $timeAgo, status: $status, '
        'applicantsCount: $applicantsCount, helperName: $helperName, '
        'category: $category, location: $location, distance: $distance, '
        'isPostedByMe: $isPostedByMe, posterName: $posterName)';
  }
}
