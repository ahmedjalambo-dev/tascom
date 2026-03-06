import 'package:flutter/material.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/widgets/my_label.dart';
import 'package:tascom/core/widgets/my_selector.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_category.dart';

class TaskCategorySelector extends StatelessWidget {
  const TaskCategorySelector({
    super.key,
    required this.selectedCategory,
    required this.onTap,
  });

  final TaskCategory? selectedCategory;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyLabel('Category'),
        const VerticalSpace(8),
        MySelector(
          icon: selectedCategory?.icon ?? MyIcons.dashboardStroke,
          label: selectedCategory?.displayName ?? 'Select Category',
          isPlaceholder: selectedCategory == null,
          onTap: onTap,
        ),
      ],
    );
  }
}
