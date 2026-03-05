import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/my_icons.dart';
import '../../../../core/themes/my_colors.dart';
import '../../../../core/themes/my_text_styles.dart';
import '../../../home/data/models/task_category.dart';
import '../../../home/data/models/task_priority.dart';
import '../../data/models/map_tasks_response.dart';

class TaskPopup extends StatelessWidget {
  final MapTaskData task;
  final VoidCallback onViewDetails;
  final VoidCallback onDismiss;

  const TaskPopup({
    super.key,
    required this.task,
    required this.onViewDetails,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final category = TaskCategory.fromApiValue(task.category);
    final priority = TaskPriority.fromApiValue(task.priority);

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _PopupHeader(
            title: task.title,
            creatorName: task.creator.name,
            onDismiss: onDismiss,
          ),
          SizedBox(height: 10.h),
          _PopupChipsRow(
            category: category,
            priority: priority,
            points: task.pointsOffered ?? 0,
          ),
          SizedBox(height: 12.h),
          _ViewDetailsButton(onPressed: onViewDetails),
        ],
      ),
    );
  }
}

class _PopupHeader extends StatelessWidget {
  final String title;
  final String creatorName;
  final VoidCallback onDismiss;

  const _PopupHeader({
    required this.title,
    required this.creatorName,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: MyTextStyles.body.body1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: MyColors.text.primary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
              onTap: onDismiss,
              child: Icon(
                Icons.close,
                size: 20.w,
                color: MyColors.text.third,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          'by $creatorName',
          style: MyTextStyles.caption.captionNotes.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
      ],
    );
  }
}

class _PopupChipsRow extends StatelessWidget {
  final TaskCategory category;
  final TaskPriority priority;
  final int points;

  const _PopupChipsRow({
    required this.category,
    required this.priority,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Chip(
          icon: category.icon,
          label: category.displayName,
          backgroundColor: category.backgroundColor,
          labelColor: category.textColor,
          iconColor: category.textColor,
        ),
        SizedBox(width: 6.w),
        _Chip(
          icon: priority.icon,
          label: priority.displayName,
          backgroundColor: priority.backgroundColor,
          labelColor: priority.textColor,
        ),
        const Spacer(),
        _PointsBadge(points: points),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String icon;
  final String label;
  final Color backgroundColor;
  final Color labelColor;
  final Color? iconColor;

  const _Chip({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.labelColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            icon,
            width: 14.w,
            height: 14.w,
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                : null,
          ),
          SizedBox(width: 4.w),
          Text(
            label,
            style: MyTextStyles.label.label2.copyWith(color: labelColor),
          ),
        ],
      ),
    );
  }
}

class _PointsBadge extends StatelessWidget {
  final int points;

  const _PointsBadge({required this.points});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          MyIcons.pointsSolid,
          width: 16.w,
          height: 16.w,
          colorFilter: ColorFilter.mode(
            MyColors.brand.purple,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 4.w),
        Text(
          '$points pts',
          style: MyTextStyles.label.label1.copyWith(
            color: MyColors.brand.purple,
          ),
        ),
      ],
    );
  }
}

class _ViewDetailsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const _ViewDetailsButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.brand.purple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          elevation: 0,
        ),
        child: Text(
          'View Details',
          style: MyTextStyles.button.secondaryButton2.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
