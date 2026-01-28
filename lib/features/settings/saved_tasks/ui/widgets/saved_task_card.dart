import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class SavedTaskCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String points;
  final String description;

  const SavedTaskCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.points,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.background.secondary,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border.all(color: MyColors.border.postBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
            child: Image.asset(
              imagePath,
              height: 105.h, // تقليل بسيط للارتفاع لراحة النص
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          
          // Content Section
          Padding(
            padding: EdgeInsets.all(10.r), // Standardized padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Ensure column only takes needed space
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyle.body.body2.copyWith(
                          fontWeight: FontWeight.bold,
                          color: MyColors.text.primary,
                          fontSize: 13.sp, // Slightly more compact
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.bookmark, color: MyColors.brand.purple, size: 20.sp),
                  ],
                ),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    SvgPicture.asset('assets/svg/zap.svg', width: 14.sp),
                    SizedBox(width: 4.w),
                    Text(
                      points,
                      style: MyTextStyle.label.label1.copyWith(
                        color: MyColors.brand.purple,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: MyTextStyle.label.label2.copyWith(
                    color: MyColors.text.secondary,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
