import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

/// The search bar widget for the home screen with filter options.
class HomeSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;
  final String selectedFilter;

  const HomeSearchBar({
    super.key,
    this.controller,
    this.onChanged,
    this.onFilterTap,
    this.selectedFilter = 'Tasks',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Row(
        children: [
          // Search input
          Expanded(
            child: Container(
              height: 46.h,
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: MyColors.background.secondary,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: MyColors.border.border),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/search/search.svg',
                    width: 16.sp,
                    height: 16.sp,
                    colorFilter: ColorFilter.mode(
                      MyColors.icons.icon,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onChanged: onChanged,
                      style: MyTextStyle.body.body2.copyWith(
                        color: MyColors.text.primary,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: MyTextStyle.body.body2.copyWith(
                          color: MyColors.text.third,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          // Filter button
          GestureDetector(
            onTap: onFilterTap,
            child: Container(
              height: 46.h,
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              decoration: BoxDecoration(
                color: MyColors.background.secondary,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: MyColors.border.border),
              ),
              child: Row(
                children: [
                  Icon(Icons.tune, size: 20.sp, color: MyColors.icons.icon),
                  SizedBox(width: 8.w),
                  Text(
                    selectedFilter,
                    style: MyTextStyle.body.body2.copyWith(
                      color: MyColors.text.primary,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 20.sp,
                    color: MyColors.icons.icon,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
