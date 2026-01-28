import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class WarningBox extends StatelessWidget {
  const WarningBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDADA), // Light red background matching design
        
        border: Border(
          left: BorderSide(
            color: MyColors.states.error,
            width: 10.w,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
         Icons.report_problem,
                color: MyColors.states.error,
                size: 24.sp,
                
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  "Warning: This action is permanent",
                  style: MyTextStyle.body.body2.copyWith(
                  
                    color: MyColors.states.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            "Once you delete your account, all of your data will be permanently lost. Please be certain.",
            style: MyTextStyle.caption.captionNotes.copyWith(
    
              color: MyColors.states.error,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
