import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

class ProfileStatsCard extends StatelessWidget {
  final int points;
  final int postedCount;
  final int claimedCount;
  final int completedCount;

  const ProfileStatsCard({
    super.key,
    required this.points,
    required this.postedCount,
    required this.claimedCount,
    required this.completedCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.border.postBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatItem(_formatNumber(points), 'Points'),
          _buildDivider(),
          _buildStatItem(postedCount.toString(), 'Posted'),
          _buildDivider(),
          _buildStatItem(claimedCount.toString(), 'Claimed'),
          _buildDivider(),
          _buildStatItem(completedCount.toString(), 'Completed'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: MyTextStyles.button.primaryButton1.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: MyTextStyles.label.label1.copyWith(color: MyColors.text.third),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(height: 40.h, width: 1, color: MyColors.border.postBorder);
  }

  String _formatNumber(int number) {
    if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(number % 1000 == 0 ? 0 : 1)}k';
    }
    return number.toString();
  }
}
