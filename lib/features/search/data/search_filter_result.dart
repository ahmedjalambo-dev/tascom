import 'package:flutter/material.dart';
import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';

class SearchFilterResult {
  final Set<TaskCategory> categories;
  final TaskPriority? priority;
  final RangeValues pointsRange;
  final RangeValues locationRange;

  const SearchFilterResult({
    required this.categories,
    this.priority,
    required this.pointsRange,
    required this.locationRange,
  });
}
