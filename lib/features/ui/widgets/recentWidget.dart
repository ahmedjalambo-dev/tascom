import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class Recentwidget extends StatelessWidget {
  const Recentwidget({super.key, required this.titleText, required this.icon});
  final String titleText;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 28.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Leading
            SvgPicture.asset(
              icon,
              width: 24.w,
              height: 22.h,
              color: MyColors.brand.purple,
            ),
            SizedBox(width: 8.w),

            // Title
            Expanded(
              child: Text(
                titleText,
                style: MyTextStyle.caption.captionNotes.copyWith(
                  color: MyColors.text.secondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Trailing
            Icon(Icons.north_east, size: 16.sp, color: MyColors.text.secondary),
          ],
        ),
      ),
    );
  }
}
