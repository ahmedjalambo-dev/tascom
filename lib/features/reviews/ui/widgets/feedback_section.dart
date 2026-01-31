import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class FeedbackSection extends StatelessWidget {
  const FeedbackSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        Text(
          "Additional feedback",
          style: MyTextStyle.heading.h32.copyWith(
            fontSize: 16.sp,
            color: MyColors.text.primary,
          ),
        ),
        SizedBox(height: 12.h),

        // حاوية حقل النص
        Container(
          decoration: BoxDecoration(
            color: MyColors.background.secondary,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: MyColors.border.border),
          ),
          child: TextField(
            maxLines: 10,
            decoration: InputDecoration(
              hintText: "Write your feedback here",
              hintStyle: MyTextStyle.label.label1.copyWith(color: MyColors.text.secondary),
              contentPadding: EdgeInsets.all(16.w),
              border: InputBorder.none, // إزالة الحدود الافتراضية لأننا وضعناها في الـ Container
            ),
          ),
        ),
        
        SizedBox(height: 24.h),

        // زر الإرسال
        SizedBox(
          width: double.infinity,
          height: 50.h,
          child: ElevatedButton(
            onPressed: () {
              // أكشن الإرسال هنا
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.brand.purple, // لون الزر البنفسجي من مشروعك
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r),
              ),
            ),
            child: Text(
              "Submit feedback",
              style: MyTextStyle.label.label1.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}