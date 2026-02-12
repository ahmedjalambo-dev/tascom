import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';

enum TaskStatus { active, open, inProgress, completed, cancelled }

extension TaskStatusExtension on TaskStatus {
  String get displayName {
    switch (this) {
      case TaskStatus.active:
        return 'Active';
      case TaskStatus.open:
        return 'Open';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.cancelled:
        return 'Cancelled';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TaskStatus.active:
        return const Color(0xFFE8F5E9);
      case TaskStatus.open:
        return MyColors.priority.medium.bg;
      case TaskStatus.inProgress:
        return const Color(0xFFFFF3E0);
      case TaskStatus.completed:
        return const Color(0xFFE3F2FD);
      case TaskStatus.cancelled:
        return MyColors.priority.high.bg;
    }
  }

  Color get textColor {
    switch (this) {
      case TaskStatus.active:
        return MyColors.status.active;
      case TaskStatus.open:
        return MyColors.priority.medium.text;
      case TaskStatus.inProgress:
        return MyColors.status.inProgress;
      case TaskStatus.completed:
        return MyColors.status.completed;
      case TaskStatus.cancelled:
        return MyColors.priority.high.text;
    }
  }
}
