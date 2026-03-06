import 'package:intl/intl.dart';

import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_location.dart';
import 'package:tascom/features/home/data/models/task_metrics.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';
import 'package:tascom/features/home/data/models/task_status.dart';
import 'package:tascom/features/home/data/models/user_model.dart';
import 'search_task_data.dart';

extension SearchTaskMapper on SearchTaskData {
  TaskModel toTaskModel({String? locationName}) {
    return TaskModel(
      id: id,
      author: UserModel(
        id: creator?.id ?? creatorId,
        name: creator?.name ?? 'Unknown',
        avatar: null,
        rating: 0,
      ),
      createdAt: DateTime.parse(createdAt),
      title: title,
      description: description,
      category: TaskCategory.fromApiValue(category),
      priority: TaskPriority.fromApiValue(priority),
      status: TaskStatus.fromApiValue(status),
      location: TaskLocation(
        name: locationName ?? '$latitude, $longitude',
        latitude: latitude,
        longitude: longitude,
      ),
      duration: _formatDuration(),
      metrics: TaskMetrics(points: pointsOffered ?? 0, distance: distance),
      likeCount: numOfLikes ?? 0,
      commentCount: 0,
      imageUrl: assets.isNotEmpty ? assets.first.url : null,
    );
  }

  String _formatDuration() {
    if (isExpired) return 'Expired';
    if (remainingDays > 0) {
      return '$remainingDays day${remainingDays > 1 ? 's' : ''}';
    }
    if (remainingHours > 0) {
      return '$remainingHours hour${remainingHours > 1 ? 's' : ''}';
    }
    if (deadline != null) {
      try {
        final deadlineDate = DateTime.parse(deadline!);
        final difference = deadlineDate.difference(DateTime.now());
        if (difference.isNegative) return 'Expired';
        if (difference.inDays > 0) {
          return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''}';
        }
        if (difference.inHours > 0) {
          return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''}';
        }
        return 'Less than 1 hour';
      } catch (_) {
        return DateFormat('MMM dd').format(DateTime.parse(deadline!));
      }
    }
    return 'No deadline';
  }
}
