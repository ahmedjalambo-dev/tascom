import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

class MySelector extends StatelessWidget {
  const MySelector({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isPlaceholder = true,
    this.showDropdownIcon = true,
    this.iconColor,
  });

  final String icon;
  final String label;
  final VoidCallback onTap;
  final bool isPlaceholder;
  final bool showDropdownIcon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final effectiveIconColor =
        iconColor ??
        (isPlaceholder ? MyColors.text.third : MyColors.brand.purple);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          border: Border.all(color: MyColors.border.border, width: 1.5),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                effectiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                label,
                style: MyTextStyles.body.body2.copyWith(
                  color: isPlaceholder
                      ? MyColors.text.third
                      : MyColors.text.primary,
                ),
              ),
            ),
            if (showDropdownIcon)
              SvgPicture.asset(
                MyIcons.arrowDown,
                width: 20.w,
                height: 20.h,
                colorFilter: ColorFilter.mode(
                  MyColors.text.third,
                  BlendMode.srcIn,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
