import 'dart:io';

import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';

class CreateTaskRequest {
  final String title;
  final String description;
  final TaskCategory category;
  final TaskPriority priority;
  final double? latitude;
  final double? longitude;
  final DateTime? deadline;
  final File? file;

  CreateTaskRequest({
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    this.latitude,
    this.longitude,
    this.deadline,
    this.file,
  });
}
