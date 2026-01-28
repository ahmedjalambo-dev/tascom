import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/features/profile/data/task_model.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/profile/ui/widgets/task_status_badge.dart';
import 'package:tascom/features/profile/ui/widgets/person_chip.dart';
import 'package:tascom/features/profile/ui/widgets/task_actions_section.dart';

/// A card widget that displays a single task with its details and actions.
class TaskListItem extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onTap;
  final bool isPostedTab;
  final VoidCallback? onRemoveTask;
  final VoidCallback? onViewApplicants;
  final VoidCallback? onCancelTask;
  final VoidCallback? onMarkAsDone;

  const TaskListItem({
    super.key,
    required this.task,
    this.onTap,
    required this.isPostedTab,
    this.onRemoveTask,
    this.onViewApplicants,
    this.onCancelTask,
    this.onMarkAsDone,
  });

  /// Returns the appropriate category icon path based on category name.
  String _getCategoryIcon(String category) {
    final categoryLower = category.toLowerCase();
    if (categoryLower.contains('home')) {
      return 'assets/icons/post-categories/home-services.svg';
    } else if (categoryLower.contains('errand')) {
      return 'assets/icons/post-categories/errands.svg';
    } else if (categoryLower.contains('pet')) {
      return 'assets/icons/post-categories/pet-care.svg';
    } else if (categoryLower.contains('repair')) {
      return 'assets/icons/post-categories/repairs.svg';
    } else if (categoryLower.contains('transport')) {
      return 'assets/icons/post-categories/transportation.svg';
    } else if (categoryLower.contains('tutor')) {
      return 'assets/icons/post-categories/tutoring.svg';
    }
    return 'assets/icons/post-categories/home-services.svg'; // Default
  }

  @override
  Widget build(BuildContext context) {
    final String statusLower = task.status.toLowerCase();
    final bool showPersonChip = statusLower == 'in progress' ||
                                 statusLower == 'completed' ||
                                 statusLower == 'canceled';

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: MyColors.border.border.withValues(alpha: 0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Status Badge Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  task.title,
                  style: MyTextStyle.body.body2.copyWith(
                    fontWeight: FontWeight.w600,
                    color: MyColors.text.primary,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              TaskStatusBadge(status: task.status),
            ],
          ),

          // Posted/Canceled time
          const SizedBox(height: 4),
          Text(
            statusLower == 'canceled'
                ? "Canceled date: ${task.timeAgo}"
                : "Posted ${task.timeAgo}",
            style: MyTextStyle.label.label1.copyWith(
              color: MyColors.text.third,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 13.h),

          // Helper/Poster chip (for in progress, completed, and canceled tasks)
          if (showPersonChip)
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: PersonChip(
                name: isPostedTab
                    ? (task.helperName ?? 'Ali Rayyan')
                    : (task.posterName ?? 'Ali Rayyan'),
                avatarUrl: "https://i.pravatar.cc/300?img=12",
                label: isPostedTab ? "Helper:" : "Poster:",
              ),
            ),

          // Category and Location Tags
          Row(
            children: [
              _buildTag(_getCategoryIcon(task.category), task.category),
              SizedBox(width: 12.w),
              _buildTag('assets/icons/post/location.svg', task.location),
            ],
          ),

          // Actions Section (buttons or points info)
          TaskActionsSection(
            status: task.status,
            isPostedTab: isPostedTab,
            helperName: task.helperName,
            onRemoveTask: onRemoveTask,
            onViewApplicants: onViewApplicants,
            onCancelTask: onCancelTask,
            onMarkAsDone: onMarkAsDone,
          ),
        ],
      ),
    );
  }

  /// Builds a tag widget for category or location.
  Widget _buildTag(String iconPath, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: MyColors.background.cardHover,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 14.sp,
            height: 14.sp,
            colorFilter: ColorFilter.mode(
              MyColors.brand.purple,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 4.w),
          Flexible(
            child: Text(
              text,
              style: MyTextStyle.label.label2.copyWith(
                fontSize: 11,
                color: MyColors.brand.purple,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
