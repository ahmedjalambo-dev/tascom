import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class AppPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String? hintText;
  final String? helperText;
  final String? Function(String?)? validator;

  const AppPasswordField({
    super.key,
    required this.controller,
    required this.title,
    this.hintText,
    this.helperText,
    this.validator,
  });

  @override
  State<AppPasswordField> createState() => _AppPasswordFieldState();
}

class _AppPasswordFieldState extends State<AppPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: MyTextStyle.body.body1.copyWith(
            fontWeight: FontWeight.w500,
            color: MyColors.text.primary,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          style: MyTextStyle.body.body1.copyWith(color: MyColors.text.primary),
          decoration: InputDecoration(
            hintText: widget.hintText ?? '********',
            hintStyle: MyTextStyle.body.body2.copyWith(color: MyColors.text.third),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            prefixIcon: Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                'assets/svg/lock-password.svg',
                width: 20.w,
                height: 20.w,
                colorFilter: ColorFilter.mode(MyColors.text.primary, BlendMode.srcIn),
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                color: MyColors.text.primary,
                size: 20.sp,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: MyColors.states.error),
            ),
          ),
          validator: widget.validator,
        ),
        if (widget.helperText != null) ...[
          SizedBox(height: 4.h),
          Text(
            widget.helperText!,
            style: MyTextStyle.label.label1.copyWith(
              color: MyColors.text.secondary,
            ),
          ),
        ],
        SizedBox(height: 16.h),
      ],
    );
  }
}
