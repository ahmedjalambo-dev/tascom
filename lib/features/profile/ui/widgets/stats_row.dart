import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: MyColors.text.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: _buildStatItem("5,375", "Points")),
          Expanded(child: _buildStatItem("30", "Posted")),
          Expanded(child: _buildStatItem("15", "Claimed")),
          Expanded(child: _buildStatItem("65", "Completed")),
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
          style: MyTextStyle.label.label1.copyWith(
            color: MyColors.text.third,
          ),
        ),
      ],
    );
  }
}

