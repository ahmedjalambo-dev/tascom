import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class HelperInfoSection extends StatelessWidget {
  const HelperInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Feedback for helper",
          style: MyTextStyle.heading.h32.copyWith(fontSize: 18.sp,color: MyColors.text.primary)
          
          ,
        ),
        SizedBox(height: 8.h),
        Text(
          "You are rating the person who\n completed the task.",
          style: MyTextStyle.body.body1.copyWith(color: MyColors.text.secondary),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            CircleAvatar(
              radius: 24.r,
              backgroundColor: MyColors.background.cardHover,
              child: Image.asset('assets/images/Ellipse 18.png'),
              // child: SvgPicture.asset(
              //   'assets/svg/profile_person.svg',
              //   width: 24.w,
              //   colorFilter: ColorFilter.mode(MyColors.brand.purple, BlendMode.srcIn),
              // ),
            ),
            SizedBox(width: 12.w),
            Text(
              "Ali Rayyan",
              style: MyTextStyle.heading.h32.copyWith(color: MyColors.text.primary),
            ),
            SizedBox(height: 4.h),
          
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            _buildInfoPill(Icons.location_on, "Ramallah, Palestine"),
            SizedBox(width: 8.w),
            _buildInfoPill(Icons.check_circle_outline, "30 tasks done"),
          
          ],
        ),
        SizedBox(height: 8.h),
             _buildInfoPill(Icons.star, "3.4"),
      ],
    );
  }

  Widget _buildInfoPill(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: MyColors.brand.purple, size: 14.sp),
          SizedBox(width: 4.w),
          Text(text, style: MyTextStyle.caption.captionNotes.copyWith(color: MyColors.brand.purple)),
        ],
      ),
    );
  }
}
