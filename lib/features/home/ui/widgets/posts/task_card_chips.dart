import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';

class TaskCardChips extends StatelessWidget {
  final TaskCategory category;
  final TaskPriority priority;

  const TaskCardChips({
    super.key,
    required this.category,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Category Chip
        _CategoryChip(category: category),
        const HorizontalSpace(8),
        // Priority Chip
        _PriorityChip(priority: priority),
      ],
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final TaskCategory category;

  const _CategoryChip({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: category.backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            category.icon,
            width: 18.w,
            height: 18.w,
            colorFilter: ColorFilter.mode(category.textColor, BlendMode.srcIn),
          ),
          const HorizontalSpace(6),
          Text(
            category.displayName,
            style: MyTextStyles.label.label1.copyWith(
              color: category.textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _PriorityChip extends StatelessWidget {
  final TaskPriority priority;

  const _PriorityChip({required this.priority});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: priority.backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            priority.icon,
            width: 18.w,
            height: 18.w,
            colorFilter: ColorFilter.mode(priority.textColor, BlendMode.srcIn),
          ),
          const HorizontalSpace(6),
          Text(
            priority.displayName,
            style: MyTextStyles.label.label1.copyWith(
              color: priority.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
