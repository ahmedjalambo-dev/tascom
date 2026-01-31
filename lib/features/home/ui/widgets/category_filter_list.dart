import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/features/home/data/models/category_model.dart';
import 'category_chip.dart';

/// A horizontal scrollable list of category filter chips.
class CategoryFilterList extends StatelessWidget {
  final List<CategoryModel> categories;
  final String selectedCategoryId;
  final ValueChanged<String>? onCategorySelected;

  const CategoryFilterList({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
    this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryChip(
            category: category,
            isSelected: category.id == selectedCategoryId,
            onTap: () => onCategorySelected?.call(category.id),
          );
        },
      ),
    );
  }
}
