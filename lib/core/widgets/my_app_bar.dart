import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    this.leading,
    this.title,
    this.trailing,
    this.height,
    this.padding,
  });

  final Widget? leading;
  final Widget? title;
  final List<Widget>? trailing;
  final double? height;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 110.h,
      padding:
          padding ??
          EdgeInsets.only(top: 48.h, left: 16.w, right: 16.w, bottom: 16.h),
      decoration: BoxDecoration(
        color: MyColors.background.secondary,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            blurRadius: 15,
            color: MyColors.text.secondary.withAlpha(40),
            spreadRadius: 2,
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (leading != null) leading!,
          if (title != null) title!,
          const Spacer(),
          if (trailing != null) ...trailing!,
        ],
      ),
    );
  }
}
