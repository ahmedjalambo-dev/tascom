import 'package:flutter/material.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/widgets/my_label.dart';
import 'package:tascom/core/widgets/my_selector.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_priority.dart';

class TaskPrioritySelector extends StatelessWidget {
  const TaskPrioritySelector({
    super.key,
    required this.selectedPriority,
    required this.onTap,
  });

  final TaskPriority? selectedPriority;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyLabel('Priority'),
        const VerticalSpace(8),
        MySelector(
          icon: selectedPriority?.icon ?? MyIcons.priorityStroke,
          label: selectedPriority?.displayName ?? 'Select Priority',
          isPlaceholder: selectedPriority == null,
          onTap: onTap,
        ),
      ],
    );
  }
}
