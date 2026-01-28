import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/profile/ui/widgets/task_action_button.dart';

/// A widget that displays action buttons or status information
/// based on the task status and which tab is currently active.
class TaskActionsSection extends StatelessWidget {
  final String status;
  final bool isPostedTab;
  final String? helperName;
  final VoidCallback? onRemoveTask;
  final VoidCallback? onViewApplicants;
  final VoidCallback? onCancelTask;
  final VoidCallback? onMarkAsDone;

  const TaskActionsSection({
    super.key,
    required this.status,
    required this.isPostedTab,
    this.helperName,
    this.onRemoveTask,
    this.onViewApplicants,
    this.onCancelTask,
    this.onMarkAsDone,
  });

  @override
  Widget build(BuildContext context) {
    final String statusLower = status.toLowerCase();

    // Show divider and actions/info for specific statuses
    if ((statusLower == 'active' && isPostedTab) ||
        (statusLower == 'in progress') ||
        (statusLower == 'canceled') ||
        (statusLower == 'completed')) {
      return Column(
        children: [
          // Divider
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.h),
            width: double.infinity,
            height: 1.2.h,
            color: MyColors.border.border.withValues(alpha: 0.4),
          ),

          // Action buttons for Active status (Posted tab only)
          if (statusLower == 'active' && isPostedTab)
            Row(
              children: [
                Expanded(
                  child: TaskActionButton(
                    label: "Remove task",
                    color: MyColors.states.error,
                    isOutlined: true,
                    onPressed: onRemoveTask ?? () {},
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TaskActionButton(
                    label: "View Applicants",
                    color: MyColors.brand.purple,
                    onPressed: onViewApplicants ?? () {},
                  ),
                ),
              ],
            ),

          // Action buttons for In Progress status (both tabs)
          if (statusLower == 'in progress')
            Row(
              children: [
                Expanded(
                  child: TaskActionButton(
                    label: "Cancel task",
                    color: MyColors.states.error,
                    isOutlined: true,
                    onPressed: onCancelTask ?? () {},
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TaskActionButton(
                    label: "Mark as done",
                    color: MyColors.states.success,
                    onPressed: onMarkAsDone ?? () {},
                  ),
                ),
              ],
            ),

          // Status information for Canceled tasks
          if (statusLower == 'canceled')
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.person_outline,
                        size: 16.sp, color: MyColors.text.third),
                    SizedBox(width: 4.w),
                    Text(
                      isPostedTab ? "Claimed by Helper" : "Claimed by Me",
                      style: MyTextStyle.label.label2.copyWith(
                        color: MyColors.text.third,
                      ),
                    )
                  ],
                ),
                Text(
                  "-300pts",
                  style: MyTextStyle.label.label2.copyWith(
                    color: MyColors.text.third,
                  ),
                )
              ],
            ),

          // Status information for Completed tasks (Claimed tab only)
          if (statusLower == 'completed' && !isPostedTab)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.percent_outlined,
                        size: 16.sp, color: MyColors.text.third),
                    SizedBox(width: 4.w),
                    Text(
                      "Earned from task",
                      style: MyTextStyle.label.label2.copyWith(
                        color: MyColors.text.third,
                      ),
                    ),
                  ],
                ),
                Text(
                  "+300 pts",
                  style: MyTextStyle.label.label2.copyWith(
                    color: MyColors.text.third,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

          // Status information for Completed tasks (Posted tab)
          if (statusLower == 'completed' && isPostedTab)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.person_outline,
                        size: 16.sp, color: MyColors.text.third),
                    SizedBox(width: 4.w),
                    Text(
                      "Claimed by ${helperName ?? 'Helper'}",
                      style: MyTextStyle.label.label2.copyWith(
                        color: MyColors.text.third,
                      ),
                    ),
                  ],
                ),
                Text(
                  "-300pts",
                  style: MyTextStyle.label.label2.copyWith(
                    color: MyColors.text.third,
                  ),
                ),
              ],
            ),
        ],
      );
    }

    // Return empty widget if no actions/info should be shown
    return const SizedBox.shrink();
  }
}
