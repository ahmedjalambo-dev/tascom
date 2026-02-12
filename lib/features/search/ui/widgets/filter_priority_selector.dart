import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';

class FilterPrioritySelector extends StatelessWidget {
  final TaskPriority? selectedPriority;
  final ValueChanged<TaskPriority?> onChanged;

  static const Map<TaskPriority, String> _labels = {
    TaskPriority.high: 'High',
    TaskPriority.medium: 'Medium',
    TaskPriority.low: 'Low',
  };

  const FilterPrioritySelector({
    super.key,
    required this.selectedPriority,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return RadioGroup<TaskPriority>(
      groupValue: selectedPriority ?? TaskPriority.values.first,
      onChanged: (value) {
        onChanged(value == selectedPriority ? null : value);
      },
      child: Column(
        children: TaskPriority.values.map((priority) {
          final isSelected = selectedPriority == priority;
          return GestureDetector(
            onTap: () => onChanged(isSelected ? null : priority),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Row(
                children: [
                  SizedBox(
                    width: 24.w,
                    height: 24.w,
                    child: Radio<TaskPriority>(
                      value: priority,
                      toggleable: true,
                      activeColor: MyColors.brand.purple,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    _labels[priority] ?? priority.displayName,
                    style: MyTextStyles.body.body2.copyWith(
                      color: MyColors.text.primary,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
