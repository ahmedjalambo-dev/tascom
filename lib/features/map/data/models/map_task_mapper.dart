import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_location.dart';
import 'package:tascom/features/home/data/models/task_metrics.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';
import 'package:tascom/features/home/data/models/task_status.dart';
import 'package:tascom/features/home/data/models/user_model.dart';

import 'map_tasks_response.dart';

extension MapTaskMapper on MapTaskData {
  TaskModel toTaskModel() {
    return TaskModel(
      id: id,
      author: UserModel(
        id: creator.id,
        name: creator.name,
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
        name: 'Nearby',
        latitude: latitude,
        longitude: longitude,
      ),
      duration: _formatRemaining(),
      metrics: TaskMetrics(points: pointsOffered ?? 0, distance: distance),
      likeCount: numOfLikes ?? 0,
      commentCount: 0,
    );
  }

  String _formatRemaining() {
    if (isExpired) return 'Expired';
    if (remainingDays != null && remainingDays! > 0) {
      return '$remainingDays day${remainingDays! > 1 ? 's' : ''}';
    }
    if (remainingHours != null && remainingHours! > 0) {
      return '$remainingHours hour${remainingHours! > 1 ? 's' : ''}';
    }
    return 'No deadline';
  }
}
