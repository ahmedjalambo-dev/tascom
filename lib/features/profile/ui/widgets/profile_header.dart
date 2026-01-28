import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: MyColors.text.white,
              width: 3.w,
            ),
            boxShadow: [
               BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                spreadRadius: 1.r,
                blurRadius: 10.r,
              ),
            ]
          ),
          child: CircleAvatar(
            radius: 57.r,
            backgroundImage: const NetworkImage(
                "https://i.pravatar.cc/300?img=5"), // Placeholder image
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Sara Mahdi",
          style: MyTextStyle.heading.h32.copyWith(
            color: MyColors.text.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.r),
             color: MyColors.text.white,
          ),
         
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.star, color: MyColors.icons.star, size: 18.sp),
              SizedBox(width: 4.w),
             Text("4.5 (120 reviews)",
             textAlign: TextAlign.center,
             style: MyTextStyle.label.label1.copyWith(
               fontWeight: FontWeight.w500,
               color: MyColors.text.primary,
             ),)
            ],
          ),
        ),
      ],
    );
  }
}
