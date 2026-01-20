import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class ConsequenceItem extends StatelessWidget {
  final String text;
  const ConsequenceItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(4.r),
            decoration: BoxDecoration(
              color: MyColors.background.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check,
              color: MyColors.text.disable,
              size: 14.sp,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              text,
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.secondary,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
