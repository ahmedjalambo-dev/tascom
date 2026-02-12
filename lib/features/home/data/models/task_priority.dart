import 'package:flutter/material.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';

enum TaskPriority { high, medium, low }

extension TaskPriorityExtension on TaskPriority {
  String get displayName {
    switch (this) {
      case TaskPriority.high:
        return 'High Priority';
      case TaskPriority.medium:
        return 'Medium Priority';
      case TaskPriority.low:
        return 'Low Priority';
    }
  }

  String get icon {
    switch (this) {
      case TaskPriority.high:
        return MyIcons.high;
      case TaskPriority.medium:
        return MyIcons.medium;
      case TaskPriority.low:
        return MyIcons.low;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TaskPriority.high:
        return MyColors.priority.high.bg;
      case TaskPriority.medium:
        return MyColors.priority.medium.bg;
      case TaskPriority.low:
        return MyColors.priority.low.bg;
    }
  }

  Color get textColor {
    switch (this) {
      case TaskPriority.high:
        return MyColors.priority.high.text;
      case TaskPriority.medium:
        return MyColors.priority.medium.text;
      case TaskPriority.low:
        return MyColors.priority.low.text;
    }
  }
}
