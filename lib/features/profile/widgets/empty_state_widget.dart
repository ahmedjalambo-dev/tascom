import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class EmptyStateWidget extends StatelessWidget {
  final VoidCallback? onActionPressed;

  const EmptyStateWidget({
    super.key,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40.h),
       
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: MyColors.background.cardHover,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(Icons.search, size: 60.sp, color: MyColors.brand.purple),
          alignment: Alignment.center,
        ),
        SizedBox(height: 24.h),
        Text(
          "You have no active tasks yet.",
          style: MyTextStyle.heading.h32.copyWith(
            fontWeight: FontWeight.w600,
            color: MyColors.text.primary,
          ),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: Text(
            "Post a task or help others in your community to get started.",
            textAlign: TextAlign.center,
            style: MyTextStyle.body.body2.copyWith(
              color: MyColors.text.secondary,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(height: 32.h),
       Padding(
         padding: EdgeInsets.symmetric(horizontal: 24.w),
         child: SizedBox(
           width: double.infinity,
            height: 48.h,
            child: ElevatedButton(
              
              onPressed: onActionPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.brand.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                elevation: 0,
              ),
              
              child: Text(
                "Post a task",
                style: MyTextStyle.button.primaryButton1.copyWith(
                  fontWeight: FontWeight.w600,
                  color: MyColors.text.white,
                ),
              ),
            ),
          ),
       ),
      ],
    );
  }
}
