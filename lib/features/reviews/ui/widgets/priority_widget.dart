import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class PriorityWidget extends StatelessWidget {
  final String text;
  final Color color;

  const PriorityWidget({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDADA),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.local_fire_department, color: color, size: 14.sp),
          SizedBox(width: 4.w),
          Text(text, style: MyTextStyle.label.label2.copyWith(color: color)),
        ],
      ),
    );
  }
}
