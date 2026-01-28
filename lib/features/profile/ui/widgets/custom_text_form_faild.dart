import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.maxLines = 1,
    required this.hintText,
    this.validator,
    required this.title,
    this.suffix,
  });

  final TextEditingController controller;
  final int? maxLines;
  final String hintText;
  final String? Function(String?)? validator;
  final String title;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: MyTextStyle.body.body1.copyWith(
            fontWeight: FontWeight.w500,
            color: MyColors.text.primary,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          style: MyTextStyle.body.body1,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MyTextStyle.body.body2.copyWith(color: MyColors.text.third),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: MyColors.border.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: MyColors.border.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: MyColors.brand.purple),
            ),
            suffixIcon: suffix,
          ),
          validator: validator,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
