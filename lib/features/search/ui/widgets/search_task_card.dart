import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/get_tasks/data/models/all_tasks_response.dart';
import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card_chips.dart';

class SearchTaskCard extends StatelessWidget {
  final TaskResponseData task;
  final VoidCallback? onTap;

  const SearchTaskCard({super.key, required this.task, this.onTap});

  @override
  Widget build(BuildContext context) {
    final category = TaskCategory.fromApiValue(task.category);
    final priority = TaskPriority.fromApiValue(task.priority);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: MyColors.background.primary,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: MyColors.border.postBorder, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: MyTextStyles.body.body1.copyWith(
                color: MyColors.text.primary,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const VerticalSpace(8),
            Text(
              task.description,
              style: MyTextStyles.body.body2.copyWith(
                color: MyColors.text.secondary,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const VerticalSpace(12),
            TaskCardChips(category: category, priority: priority),
            if (task.pointsOffered != null) ...[
              const VerticalSpace(8),
              Row(
                children: [
                  Icon(
                    Icons.star_rounded,
                    size: 16.w,
                    color: MyColors.icons.star,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '${task.pointsOffered} points',
                    style: MyTextStyles.label.label2.copyWith(
                      color: MyColors.text.secondary,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
