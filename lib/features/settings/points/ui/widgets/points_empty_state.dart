import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class PointsEmptyState extends StatelessWidget {
  const PointsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/solid.svg',
              width: 140.w,
              colorFilter: ColorFilter.mode(
                MyColors.brand.purple.withValues(alpha: 0.1),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              "No points activity yet.",
              textAlign: TextAlign.center,
              style: MyTextStyle.heading.h32.copyWith(
                fontWeight: FontWeight.w600,
                color: MyColors.text.primary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Complete tasks to start earning points.",
              textAlign: TextAlign.center,
              maxLines: 1,
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.secondary,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
