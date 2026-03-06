import 'package:flutter/material.dart';
import 'package:tascom/core/widgets/my_label.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/core/widgets/my_text_field.dart';

class TaskTitleField extends StatelessWidget {
  const TaskTitleField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyLabel('Task Title'),
        const VerticalSpace(8),
        MyTextField(
          controller: controller,
          hintText: 'e.g. I need help in ...',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Title is required';
            }
            if (value.length < 5) {
              return 'Title must be at least 5 characters';
            }
            return null;
          },
        ),
      ],
    );
  }
}
