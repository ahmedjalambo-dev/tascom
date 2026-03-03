import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class WarningCard extends StatelessWidget {
  const WarningCard({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.states.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border(
          left: BorderSide(color: MyColors.states.error, width: 4.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                MyIcons.warningSolid,
                width: 24.w,
                height: 24.w,
                colorFilter: ColorFilter.mode(
                  MyColors.states.error,
                  BlendMode.srcIn,
                ),
              ),
              const HorizontalSpace(8),
              Expanded(
                child: Text(
                  title,
                  style: MyTextStyles.button.secondaryButton2.copyWith(
                    color: MyColors.states.error,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const VerticalSpace(8),
          Text(
            description,
            style: MyTextStyles.caption.captionNotes.copyWith(
              color: MyColors.states.error,
            ),
          ),
        ],
      ),
    );
  }
}
