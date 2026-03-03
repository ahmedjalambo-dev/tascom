import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_category.dart';

class FilterCategoryWrap extends StatelessWidget {
  final Set<TaskCategory> selectedCategories;
  final ValueChanged<TaskCategory> onCategoryTap;

  static const List<TaskCategory> _filterCategories = [
    TaskCategory.pet,
    TaskCategory.repairs,
    TaskCategory.teaching,
    TaskCategory.shopping,
    TaskCategory.transportation,
    TaskCategory.homeService,
  ];

  static const Map<TaskCategory, String> _filterLabels = {
    TaskCategory.pet: 'Pet Care',
    TaskCategory.repairs: 'Repairs',
    TaskCategory.teaching: 'Tutoring',
    TaskCategory.shopping: 'Errands',
    TaskCategory.transportation: 'Transportation',
    TaskCategory.homeService: 'Home services',
  };

  const FilterCategoryWrap({
    super.key,
    required this.selectedCategories,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: _filterCategories.map((category) {
        final isSelected = selectedCategories.contains(category);
        return _FilterCategoryChip(
          label: _filterLabels[category] ?? category.displayName,
          icon: category.icon,
          isSelected: isSelected,
          onTap: () => onCategoryTap(category),
        );
      }).toList(),
    );
  }
}

class _FilterCategoryChip extends StatelessWidget {
  final String label;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterCategoryChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
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
              icon,
              width: 18.w,
              height: 18.w,
              colorFilter: ColorFilter.mode(contentColor, BlendMode.srcIn),
            ),
            const HorizontalSpace(8),
            Text(
              label,
              style: MyTextStyles.label.label1.copyWith(color: contentColor),
            ),
          ],
        ),
      ),
    );
  }
}
