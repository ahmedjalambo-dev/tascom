import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_model.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card_chips.dart';
import 'package:tascom/features/home/ui/widgets/posts/task_card_info_row.dart';

class MapTaskCard extends StatelessWidget {
  final TaskModel taskModel;
  final VoidCallback? onTap;

  const MapTaskCard({super.key, required this.taskModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: MyColors.background.primary,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: MyColors.border.postBorder, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Author name + time (no avatar)
              Row(
                children: [
                  Expanded(
                    child: Text(
                      taskModel.author.name,
                      overflow: TextOverflow.ellipsis,
                      style: MyTextStyles.body.body2.copyWith(
                        color: MyColors.text.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const HorizontalSpace(8),
                  Text(
                    taskModel.timeAgo,
                    style: MyTextStyles.label.label2.copyWith(
                      color: MyColors.text.third,
                    ),
                  ),
                ],
              ),
              const VerticalSpace(12),

              // Title
              Text(
                taskModel.title,
                style: MyTextStyles.body.body1.copyWith(
                  color: MyColors.text.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const VerticalSpace(8),

              // Description
              Text(
                taskModel.description,
                style: MyTextStyles.body.body2.copyWith(
                  color: MyColors.text.secondary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const VerticalSpace(12),

              // Category and Priority Chips
              TaskCardChips(
                category: taskModel.category,
                priority: taskModel.priority,
              ),
              const VerticalSpace(12),

              // Info Row: Location, Duration, Points
              TaskCardInfoRow(
                location: taskModel.location.name,
                duration: taskModel.duration,
                points: taskModel.metrics.points,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
