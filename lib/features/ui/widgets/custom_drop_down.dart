import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class CustomDropdownW extends StatelessWidget {
  const CustomDropdownW({
    super.key,
    required this.items,
    required this.jobRoleCtrl,
    required this.onChanged,
  });

  final List<String> items;

  final TextEditingController jobRoleCtrl;

  final dynamic onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      fillColor: const Color(0xFFFDFCFF),
      onChanged: onChanged,
      //hintText: 'Menu',
      hintStyle: MyTextStyle.label.label1.copyWith(
        color: MyColors.text.primary,
      ),

      items: items,
      controller: jobRoleCtrl,
      selectedStyle: MyTextStyle.label.label1.copyWith(
        color: MyColors.brand.purple,
      ),
    );
  }
}
