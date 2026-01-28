import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class EmptyStateWidget extends StatelessWidget {
  final VoidCallback? onActionPressed;
  final String title;
  final String description;
  final String buttonText;

  const EmptyStateWidget({
    super.key,
    this.onActionPressed,
    this.title = "You have no active tasks yet.",
    this.description = "Post a task in your community to get started.",
    this.buttonText = "Post a task",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 40.h),
        // تأكدي من مسار الصورة الصحيح في مشروعك
        SvgPicture.asset('assets/svg/Objects.svg'),
        SizedBox(height: 24.h),

        // العنوان
        Text(
          title,
          textAlign: TextAlign.center,
          style: MyTextStyle.heading.h32.copyWith(
            fontWeight: FontWeight.w600,
            color: MyColors.text.primary,
          ),
        ),
        SizedBox(height: 8.h),

        // الوصف (تم تعديل المسافات لضمان سطر واحد)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w), // تقليل المسافة الجانبية لإعطاء مساحة للنص
          child: Text(
            description,
            textAlign: TextAlign.center,
            maxLines: 1, // إجبار النص على سطر واحد
            overflow: TextOverflow.ellipsis, // وضع نقاط في حال كان النص أطول من الشاشة
            style: MyTextStyle.body.body2.copyWith(
              color: MyColors.text.secondary,
              height: 1.2, // تقليل الارتفاع يجعل السطر يبدو متوازناً
            ),
          ),
        ),

        SizedBox(height: 32.h),

        // الزر
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
                elevation: 0,
              ),
              child: Text(
                buttonText,
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
