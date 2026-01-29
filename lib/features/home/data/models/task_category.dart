import 'package:flutter/material.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';

enum TaskCategory {
  homeService,
  repairs,
  pet,
  shopping,
  transportation,
  labor,
  teaching,
}

extension TaskCategoryExtension on TaskCategory {
  String get displayName {
    switch (this) {
      case TaskCategory.homeService:
        return 'Home Services';
      case TaskCategory.repairs:
        return 'Repairs';
      case TaskCategory.pet:
        return 'Pet Care';
      case TaskCategory.shopping:
        return 'Shopping';
      case TaskCategory.transportation:
        return 'Transportation';
      case TaskCategory.labor:
        return 'Labor';
      case TaskCategory.teaching:
        return 'Teaching';
    }
  }

  String get icon {
    switch (this) {
      case TaskCategory.homeService:
        return MyIcons.homeServiceStroke;
      case TaskCategory.repairs:
        return MyIcons.miningStroke;
      case TaskCategory.pet:
        return MyIcons.petStroke;
      case TaskCategory.shopping:
        return MyIcons.cartStroke;
      case TaskCategory.transportation:
        return MyIcons.carStroke;
      case TaskCategory.labor:
        return MyIcons.miningStroke;
      case TaskCategory.teaching:
        return MyIcons.teachingStroke;
    }
  }

  Color get backgroundColor {
    return MyColors.brand.purple.withValues(alpha: 0.1);
  }

  Color get textColor {
    return MyColors.brand.purple;
  }
}
