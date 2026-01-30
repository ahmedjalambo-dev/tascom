import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';

enum TaskStatus {
  open,
  inProgress,
  completed,
  cancelled,
}

extension TaskStatusExtension on TaskStatus {
  String get displayName {
    switch (this) {
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
      case TaskStatus.open:
        return MyColors.priority.medium.bg;
      case TaskStatus.inProgress:
        return MyColors.brand.purple.withValues(alpha: 0.1);
      case TaskStatus.completed:
        return MyColors.priority.low.bg;
      case TaskStatus.cancelled:
        return MyColors.priority.high.bg;
    }
  }

  Color get textColor {
    switch (this) {
      case TaskStatus.open:
        return MyColors.priority.medium.text;
      case TaskStatus.inProgress:
        return MyColors.brand.purple;
      case TaskStatus.completed:
        return MyColors.priority.low.text;
      case TaskStatus.cancelled:
        return MyColors.priority.high.text;
    }
  }
}
