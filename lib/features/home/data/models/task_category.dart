import 'package:flutter/material.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';

enum TaskCategory {
  homeService,
  repairs,
  pet,
  shopping,
  transportation,
  teaching;

  static TaskCategory fromApiValue(String value) {
    switch (value) {
      case 'HomeServices':
        return TaskCategory.homeService;
      case 'Repairs':
        return TaskCategory.repairs;
      case 'PetCare':
        return TaskCategory.pet;
      case 'Transportation':
        return TaskCategory.transportation;
      case 'Tutoring':
        return TaskCategory.teaching;
      case 'Errands':
        return TaskCategory.shopping;
      default:
        return TaskCategory.homeService;
    }
  }
}

extension TaskCategoryExtension on TaskCategory {
  String get toApiValue {
    switch (this) {
      case TaskCategory.homeService:
        return 'HomeServices';
      case TaskCategory.repairs:
        return 'Repairs';
      case TaskCategory.pet:
        return 'PetCare';
      case TaskCategory.shopping:
        return 'HomeServices';
      case TaskCategory.transportation:
        return 'Transportation';
      case TaskCategory.teaching:
        return 'Tutoring';
    }
  }

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
      case TaskCategory.teaching:
        return 'Teaching';
    }
  }

  String get icon {
    switch (this) {
      case TaskCategory.homeService:
        return MyIcons.homeServiceSolid;
      case TaskCategory.repairs:
        return MyIcons.miningSolid;
      case TaskCategory.pet:
        return MyIcons.petSolid;
      case TaskCategory.shopping:
        return MyIcons.cartSolid;
      case TaskCategory.transportation:
        return MyIcons.carSolid;
      case TaskCategory.teaching:
        return MyIcons.teachingSolid;
    }
  }

  String get iconStroke {
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
