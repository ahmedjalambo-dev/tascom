import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(title, style: MyTextStyle.heading.sectionTitle.copyWith(color: MyColors.text.primary),),
    );
  }
}
