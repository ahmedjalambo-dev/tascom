import 'package:flutter/material.dart';
import 'package:tascom/core/widgets/my_label.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/core/widgets/my_text_field.dart';

class TaskDescriptionField extends StatelessWidget {
  const TaskDescriptionField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MyLabel('Description'),
        const VerticalSpace(8),
        MyTextField(
          controller: controller,
          hintText: 'Describe your task and find helpers!',
          maxLines: 5,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Description is required';
            }
            if (value.length < 10) {
              return 'Description must be at least 10 characters';
            }
            return null;
          },
        ),
      ],
    );
  }
}
