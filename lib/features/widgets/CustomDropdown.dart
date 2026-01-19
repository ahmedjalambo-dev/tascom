import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class CustomDropdownW extends StatefulWidget {
  const CustomDropdownW({Key? key}) : super(key: key);

  @override
  State<CustomDropdownW> createState() => _CustomDropdownExampleState();
}

class _CustomDropdownExampleState extends State<CustomDropdownW> {
  final jobRoleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomDropdown(
      hintText: 'Menu',
      hintStyle: MyTextStyle.label.label1.copyWith(
        color: MyColors.text.primary,
      ),
      items: const ['Lable1', 'Lable2', 'Lable3', 'Lable4'],
      controller: jobRoleCtrl,
    );
  }
}
