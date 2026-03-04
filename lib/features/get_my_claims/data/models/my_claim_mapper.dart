import 'package:intl/intl.dart';
import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_location.dart';
import 'package:tascom/features/home/data/models/task_metrics.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';
import 'package:tascom/features/home/data/models/task_status.dart';
import 'package:tascom/features/home/data/models/user_model.dart';
import 'package:tascom/features/user/data/models/user_model.dart' as api_user;

import 'my_claims_response.dart';

extension MyClaimMapper on MyClaimData {
  TaskModel toTaskModel({
    required Map<String, api_user.UserModel> creators,
    required Map<String, String> locationNames,
  }) {
    final creator = creators[task.creatorId];
    final locationKey = '${task.latitude},${task.longitude}';
    final cityName = locationNames[locationKey] ?? 'Unknown';

    return TaskModel(
      id: task.id,
      author: UserModel(
        id: task.creatorId,
        name: creator?.name ?? 'Unknown',
        avatar: creator?.avatar,
        rating: creator?.rating ?? 0,
      ),
      createdAt: DateTime.parse(task.createdAt),
      title: task.title,
      description: task.description,
      category: TaskCategory.fromApiValue(task.category),
      priority: TaskPriority.fromApiValue(task.priority),
      status: TaskStatus.fromApiValue(task.status),
      location: TaskLocation(
        name: cityName,
        latitude: task.latitude,
        longitude: task.longitude,
      ),
      duration: _formatDeadline(task.deadline),
      metrics: TaskMetrics(points: task.pointsOffered ?? 0, distance: 0),
      likeCount: task.numOfLikes ?? 0,
      commentCount: 0,
      isClaimed: true,
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
