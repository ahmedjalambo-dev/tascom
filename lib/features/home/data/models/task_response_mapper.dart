import 'package:intl/intl.dart';

import 'package:tascom/features/user/data/models/user_model.dart' as api_user;
import 'all_tasks_response.dart';
import 'task_category.dart';
import 'task_location.dart';
import 'task_metrics.dart';
import 'task_model.dart';
import 'task_priority.dart';
import 'task_status.dart';
import 'user_model.dart';

extension TaskResponseMapper on TaskResponseData {
  TaskModel toTaskModel({
    required Map<String, api_user.UserModel> creators,
    required Map<String, String> locationNames,
    String? currentUserId,
  }) {
    final creator = creators[creatorId];
    final locationKey = '$latitude,$longitude';
    final cityName = locationNames[locationKey] ?? 'Unknown';

    return TaskModel(
      id: id,
      author: UserModel(
        id: creatorId,
        name: creator?.name ?? 'Unknown',
        avatar: creator?.avatar,
        rating: creator?.rating ?? 0,
      ),
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
      isClaimed:
          currentUserId != null &&
          claims.any(
            (c) => c.claimantId == currentUserId && c.status == 'PENDING',
          ),
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
