import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/settings/points/data/point_model.dart';


class PointHistoryItem extends StatelessWidget {
  final PointModel point;

  const PointHistoryItem({super.key, required this.point});

  @override
  Widget build(BuildContext context) {
    final isCancelled = point.status == PointStatus.cancelled;

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: MyColors.background.primary),
      ),
      child: Row(
        children: [
          _buildIcon(),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  point.taskName,
                  style: MyTextStyle.body.body2.copyWith(
                    color: MyColors.text.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  point.date,
                  style: MyTextStyle.caption.captionNotes.copyWith(
                    color: MyColors.text.secondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildStatusBadge(),
              SizedBox(height: 4.h),
              Text(
                "${point.isNegative ? '-' : '+'}${point.points} pts",
                style: MyTextStyle.label.label1.copyWith(
                  color: MyColors.text.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: MyColors.background.cardHover,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(10.w),
      child: SvgPicture.asset(
        point.status == PointStatus.completed ? 'assets/svg/stroke.svg' : 'assets/svg/unavailable.svg',
        colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn),
      ),
    );
  }

  Widget _buildStatusBadge() {
    final color = point.status == PointStatus.completed 
        ? MyColors.status.completed 
        : MyColors.status.cancelled;
        
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        point.status == PointStatus.completed ? "Completed" : "Cancelled",
        style: MyTextStyle.label.label2.copyWith(
          color: color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
