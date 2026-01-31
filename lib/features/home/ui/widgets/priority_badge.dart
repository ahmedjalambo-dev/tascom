import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';
import 'package:tascom/features/home/data/models/task_model.dart';

/// A badge widget that displays the priority level of a task.
class PriorityBadge extends StatelessWidget {
  final TaskPriority priority;

  const PriorityBadge({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/priority/$_priorityType.svg',
            width: 16.sp,
            height: 16.sp,
            colorFilter: ColorFilter.mode(_textColor, BlendMode.srcIn),
          ),
          HorizontalSpace(4.w),
          Text(
            _label,
            style: MyTextStyle.label.label2.copyWith(color: _textColor),
          ),
        ],
      ),
    );
  }

  String get _label {
    switch (priority) {
      case TaskPriority.high:
        return 'High Priority';
      case TaskPriority.medium:
        return 'Medium Priority';
      case TaskPriority.low:
        return 'Low Priority';
    }
  }

  String get _priorityType {
    switch (priority) {
      case TaskPriority.high:
        return 'high';
      case TaskPriority.medium:
        return 'medium';
      case TaskPriority.low:
        return 'low';
    }
  }

  Color get _backgroundColor {
    switch (priority) {
      case TaskPriority.high:
        return MyColors.priority.high.bg;
      case TaskPriority.medium:
        return MyColors.priority.medium.bg;
      case TaskPriority.low:
        return MyColors.priority.low.bg;
    }
  }

  Color get _textColor {
    switch (priority) {
      case TaskPriority.high:
        return MyColors.priority.high.text;
      case TaskPriority.medium:
        return MyColors.priority.medium.text;
      case TaskPriority.low:
        return MyColors.priority.low.text;
    }
  }
}
