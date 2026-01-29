import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/filter_category.dart';

class CategoryFilterChip extends StatelessWidget {
  final FilterCategory category;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryFilterChip({
    super.key,
    required this.category,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? MyColors.brand.purple
        : MyColors.background.primary;
    final contentColor = isSelected
        ? MyColors.text.white
        : MyColors.text.primary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.r),
          border: isSelected
              ? null
              : Border.all(color: MyColors.border.border, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              category.icon,
              width: 18.w,
              height: 18.w,
              colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
            ),
            const HorizontalSpace(8),
            Text(
              category.title,
              style: MyTextStyles.label.label1.copyWith(
                color: contentColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
