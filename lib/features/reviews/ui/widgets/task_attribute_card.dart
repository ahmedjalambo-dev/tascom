import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class TaskAttributeCard extends StatelessWidget {
  final String label;
  final Widget content;
  final Color? borderColor;
  final Color backgroundColor;

  const TaskAttributeCard({
    super.key,
    required this.label,
    required this.content,
    this.borderColor,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: borderColor != null ? Border.all(color: borderColor!) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: MyTextStyle.label.label1.copyWith(color: MyColors.text.secondary),
          ),
          SizedBox(height: 4.h),
          content,
        ],
      ),
    );
  }
}
