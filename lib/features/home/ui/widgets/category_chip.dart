import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/features/home/data/models/category_model.dart';

/// A chip widget for filtering tasks by category.
class CategoryChip extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryChip({
    super.key,
    required this.category,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? MyColors.brand.purple : MyColors.background.secondary,
          borderRadius: BorderRadius.circular(20.r),
          border: isSelected
              ? null
              : Border.all(color: MyColors.border.border, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              category.iconPath,
              width: 16.sp,
              height: 16.sp,
              colorFilter: ColorFilter.mode(
                isSelected ? MyColors.text.white : MyColors.text.primary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 6.w),
            Text(
              category.name,
              style: MyTextStyle.label.label1.copyWith(
                color: isSelected ? MyColors.text.white : MyColors.text.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
