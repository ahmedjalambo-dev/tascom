import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class RecentSearchTile extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const RecentSearchTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: MyColors.brand.purple.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Icon(
                  Icons.history_rounded,
                  size: 20.w,
                  color: MyColors.brand.purple,
                ),
              ),
            ),
            const HorizontalSpace(12),
            Expanded(
              child: Text(
                text,
                style: MyTextStyles.body.body2.copyWith(
                  color: MyColors.text.primary,
                ),
              ),
            ),
            Icon(Icons.north_east, size: 20.sp, color: MyColors.text.third),
          ],
        ),
      ),
    );
  }
}
