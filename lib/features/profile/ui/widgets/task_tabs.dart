import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class TaskTabs extends StatelessWidget {
  final bool isPostedSelected;
  final VoidCallback onPostedTap;
  final VoidCallback onClaimedTap;

  const TaskTabs({
    super.key,
    required this.isPostedSelected,
    required this.onPostedTap,
    required this.onClaimedTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.r),
      decoration: BoxDecoration(
        color: MyColors.background.primary,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onPostedTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: isPostedSelected ? MyColors.text.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(40.r),
                  boxShadow: isPostedSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4.r,
                            offset: Offset(0, 2.h),
                          )
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  "Posted",
                  style: MyTextStyle.body.body1.copyWith(
                    color: isPostedSelected
                        ? MyColors.brand.purple
                        : MyColors.text.secondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onClaimedTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  color: !isPostedSelected ? MyColors.text.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(50.r),
                  boxShadow: !isPostedSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4.r,
                            offset: Offset(0, 2.h),
                          )
                        ]
                      : [],
                ),
                alignment: Alignment.center,
                child: Text(
                  "Claimed",
                  style: MyTextStyle.body.body2.copyWith(
                    color: !isPostedSelected
                        ? MyColors.brand.purple
                        : MyColors.text.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
