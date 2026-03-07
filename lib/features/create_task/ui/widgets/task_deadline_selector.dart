import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/widgets/my_label.dart';
import 'package:tascom/core/widgets/my_selector.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class TaskDeadlineSelector extends StatelessWidget {
  const TaskDeadlineSelector({
    super.key,
    required this.selectedDeadline,
    required this.onTap,
  });

  final DateTime? selectedDeadline;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyLabel('Deadline (Optional)'),
        const VerticalSpace(8),
        MySelector(
          icon: MyIcons.calenderStroke,
          label: selectedDeadline != null
              ? DateFormat('dd/MM/yyyy').format(selectedDeadline!)
              : '00/00/0000',
          isPlaceholder: selectedDeadline == null,
          onTap: onTap,
          showDropdownIcon: false,
        ),
      ],
    );
  }
}
