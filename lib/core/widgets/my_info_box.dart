import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';

class MyInfoBoxItem {
  const MyInfoBoxItem({
    required this.prefix,
    this.highlighted,
    required this.suffix,
  });

  final String prefix;
  final String? highlighted;
  final String suffix;
}

class MyInfoBox extends StatelessWidget {
  const MyInfoBox({
    super.key,
    required this.title,
    required this.items,
    this.backgroundColor,
  });

  final String title;
  final List<MyInfoBoxItem> items;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: backgroundColor ?? MyColors.brand.purple.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: MyTextStyles.body.body2.copyWith(
              color: MyColors.text.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          ...items.map((item) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: _buildBulletPoint(item),
              )),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(MyInfoBoxItem item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '\u2022  ',
          style: MyTextStyles.caption.captionNotes.copyWith(
            color: MyColors.text.secondary,
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: MyTextStyles.caption.captionNotes.copyWith(
                color: MyColors.text.secondary,
              ),
              children: [
                TextSpan(
                  text: item.prefix,
                  style: MyTextStyles.caption.captionNotes.copyWith(
                    color: MyColors.text.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (item.highlighted != null)
                  TextSpan(
                    text: item.highlighted,
                    style: MyTextStyles.caption.captionNotes.copyWith(
                      color: MyColors.brand.purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                TextSpan(text: item.suffix),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
