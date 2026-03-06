import 'package:flutter/material.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/widgets/my_label.dart';
import 'package:tascom/core/widgets/my_selector.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class TaskLocationSelector extends StatelessWidget {
  const TaskLocationSelector({
    super.key,
    required this.isLoading,
    required this.displayName,
    required this.onTap,
  });

  final bool isLoading;
  final String? displayName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyLabel('Location (Optional)'),
        const VerticalSpace(8),
        MySelector(
          icon: MyIcons.locationStroke,
          label: isLoading
              ? 'Detecting...'
              : displayName ?? 'Detect My Location',
          isPlaceholder: displayName == null,
          onTap: onTap,
        ),
      ],
    );
  }
}
