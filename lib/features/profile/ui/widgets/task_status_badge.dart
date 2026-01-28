import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

/// A status badge widget that displays the task status with appropriate styling.
class TaskStatusBadge extends StatelessWidget {
  final String status;

  const TaskStatusBadge({
    super.key,
    required this.status,
  });

  /// Returns the color for the given status.
  Color _getStatusColor() {
    switch (status.toLowerCase()) {
      case 'active':
        return MyColors.status.inProgress; // Orange to match UI design
      case 'in progress':
        return MyColors.status.inProgress;
      case 'completed':
        return MyColors.states.success; // Green to match UI design
      case 'canceled':
        return MyColors.status.cancelled;
      default:
        return MyColors.text.secondary;
    }
  }

  /// Returns the background color for the status badge.
  Color _getStatusBackgroundColor() => _getStatusColor().withValues(alpha: 0.1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: _getStatusBackgroundColor(),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        status,
        style: MyTextStyle.label.label2.copyWith(
          color: _getStatusColor(),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
