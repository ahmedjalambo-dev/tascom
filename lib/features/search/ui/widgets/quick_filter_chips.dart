import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

class QuickFilterChips extends StatelessWidget {
  final String? selectedFilter;
  final ValueChanged<String> onFilterTap;

  static const List<String> filters = [
    'Near me',
    'Available today',
    'Top rated',
    'Quick tasks',
  ];

  const QuickFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: filters.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = filter == selectedFilter;
          return _QuickFilterChip(
            label: filter,
            isSelected: isSelected,
            onTap: () => onFilterTap(filter),
          );
        },
      ),
    );
  }
}

class _QuickFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _QuickFilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected
              ? MyColors.brand.purple
              : MyColors.background.primary,
          borderRadius: BorderRadius.circular(20.r),
          border: isSelected
              ? null
              : Border.all(color: MyColors.border.border, width: 1),
        ),
        child: Center(
          child: Text(
            label,
            style: MyTextStyles.label.label1.copyWith(
              color: isSelected ? MyColors.text.white : MyColors.text.primary,
            ),
          ),
        ),
      ),
    );
  }
}
