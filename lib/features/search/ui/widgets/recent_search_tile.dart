import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';
import 'package:tascom/features/home/data/models/task_category.dart';
import 'package:tascom/features/search/data/search_mock_data.dart';

class RecentSearchTile extends StatelessWidget {
  final RecentSearchItem item;
  final VoidCallback? onTap;

  const RecentSearchTile({super.key, required this.item, this.onTap});

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
                color: item.category.backgroundColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  item.category.icon,
                  width: 20.w,
                  height: 20.w,
                  colorFilter: ColorFilter.mode(
                    MyColors.brand.purple,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const HorizontalSpace(12),
            Expanded(
              child: Text(
                item.text,
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
