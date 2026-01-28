import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class CategoryButton extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: SvgPicture.asset(
        icon,
        width: 18.w,
        height: 16.h,
        color: isSelected ? MyColors.background.primary : MyColors.text.primary,
      ),
      label: Text(
        label,
        style: MyTextStyle.label.label1.copyWith(
          color: isSelected
              ? MyColors.background.primary
              : MyColors.text.primary,
        ),
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isSelected
            ? MyColors.brand.purple
            : MyColors.background.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
