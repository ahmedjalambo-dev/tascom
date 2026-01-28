import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

/// A tag widget that displays a category label with an icon.
class CategoryTag extends StatelessWidget {
  final String label;
  final Color color;

  const CategoryTag({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: MyColors.background.cardHover,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            'assets/icons/post-categories/$label.svg',
            width: 18.sp,
            height: 18.sp,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          SizedBox(width: 4.w),
          Text(
            label,
            style: MyTextStyle.label.label2.copyWith(
              color: MyColors.brand.purple,
            ),
          ),
        ],
      ),
    );
  }
}
