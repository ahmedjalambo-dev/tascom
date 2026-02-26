import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

class MyOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final double? height;
  final double? borderRadius;
  final Color? borderColor;
  final Color? textColor;
  final TextStyle? textStyle;

  const MyOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.textColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 48),
        side: BorderSide(
          color: borderColor ?? MyColors.border.border,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 100.r),
        ),
        foregroundColor: textColor ?? MyColors.text.primary,
        backgroundColor: Colors.white,
      ),
      child: Text(
        text,
        style:
            textStyle ??
            MyTextStyles.button.primaryButton1.copyWith(
              color: textColor ?? MyColors.text.secondary,
            ),
      ),
    );
  }
}
