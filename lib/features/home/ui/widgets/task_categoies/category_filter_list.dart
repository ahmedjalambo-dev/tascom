import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/features/home/data/models/filter_category.dart';
import 'package:tascom/features/home/ui/widgets/task_categoies/category_filter_chip.dart';

class CategoryFilterList extends StatelessWidget {
  final List<FilterCategory> categories;
  final String selectedId;
  final ValueChanged<FilterCategory>? onCategoryTap;

  const CategoryFilterList({
    super.key,
    required this.categories,
    required this.selectedId,
    this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category.id == selectedId;

          return CategoryFilterChip(
            category: category,
            isSelected: isSelected,
            onTap: () => onCategoryTap?.call(category),
          );
        },
      ),
    );
  }
}
