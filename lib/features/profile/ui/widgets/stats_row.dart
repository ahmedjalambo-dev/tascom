import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/profile/data/profile_model.dart';

/// Widget that displays the user's stats in a horizontal row.
class StatsRow extends StatelessWidget {
  final ProfileModel profile;

  const StatsRow({super.key, required this.profile});

  /// Formats a number with thousand separators.
  String _formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: MyColors.text.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.border.border, width: 1.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _buildStatItem(_formatNumber(profile.points), "Points"),
          ),
          Expanded(
            child: _buildStatItem(profile.postedCount.toString(), "Posted"),
          ),
          Expanded(
            child: _buildStatItem(profile.claimedCount.toString(), "Claimed"),
          ),
          Expanded(
            child: _buildStatItem(
              profile.completedCount.toString(),
              "Completed",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: MyTextStyle.body.body2.copyWith(
            fontWeight: FontWeight.bold,
            color: MyColors.text.primary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: MyTextStyle.label.label1.copyWith(color: MyColors.text.third),
        ),
      ],
    );
  }
}
