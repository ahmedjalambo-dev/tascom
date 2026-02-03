import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

class MyLabel extends StatelessWidget {
  const MyLabel(
    this.label, {
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: MyTextStyles.body.body1.copyWith(
        color: MyColors.text.primary,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
