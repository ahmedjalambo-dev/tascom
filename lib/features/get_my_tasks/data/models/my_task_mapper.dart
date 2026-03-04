import 'package:intl/intl.dart';
import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_location.dart';
import 'package:tascom/features/home/data/models/task_metrics.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';
import 'package:tascom/features/home/data/models/task_status.dart';
import 'package:tascom/features/home/data/models/user_model.dart';

import 'my_tasks_response.dart';

extension MyTaskMapper on MyTaskData {
  TaskModel toTaskModel({
    required UserModel currentUser,
    required Map<String, String> locationNames,
  }) {
    final locationKey = '$latitude,$longitude';
    final cityName = locationNames[locationKey] ?? 'Unknown';

    return TaskModel(
      id: id,
      author: currentUser,
      createdAt: DateTime.parse(createdAt),
      title: title,
      description: description,
      category: TaskCategory.fromApiValue(category),
      priority: TaskPriority.fromApiValue(priority),
      status: TaskStatus.fromApiValue(status),
      location: TaskLocation(
        name: cityName,
        latitude: latitude,
        longitude: longitude,
      ),
      duration: _formatDeadline(deadline),
      metrics: TaskMetrics(points: pointsOffered ?? 0, distance: 0),
      likeCount: numOfLikes ?? 0,
      commentCount: 0,
    );
  }

  String _formatDeadline(String? deadline) {
    if (deadline == null) return 'No deadline';
    try {
      final deadlineDate = DateTime.parse(deadline);
      final now = DateTime.now();
      final difference = deadlineDate.difference(now);

      if (difference.isNegative) return 'Expired';
      if (difference.inDays > 0) {
        return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''}';
      }
      if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''}';
      }
      return 'Less than 1 hour';
    } catch (_) {
      return DateFormat('MMM dd').format(DateTime.parse(deadline));
    }
  }
}
