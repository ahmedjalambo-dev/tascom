import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class ReportsEmptyState extends StatelessWidget {
  const ReportsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: MyColors.background.cardHover,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Icon(Icons.search, size: 60.sp, color: MyColors.brand.purple),
            ),
            const SizedBox(height: 24),
            Text(
              "No reported tasks yet",
              style: MyTextStyle.heading.h32.copyWith(
                fontWeight: FontWeight.w600,
                color: MyColors.text.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "There are no tasks reported at the moment.\nIf an issue arises, reported tasks\nwill appear here for review.",
              textAlign: TextAlign.center,
              style: MyTextStyle.body.body2.copyWith(
                color: MyColors.text.secondary,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
