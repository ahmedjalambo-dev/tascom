import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class ConsequenceItem extends StatelessWidget {
  const ConsequenceItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            MyIcons.checkboxSolid,
            width: 24.w,
            height: 24.w,
            colorFilter: ColorFilter.mode(MyColors.text.third, BlendMode.srcIn),
          ),
          const HorizontalSpace(12),
          Expanded(
            child: Text(
              text,
              style: MyTextStyles.body.body2.copyWith(
                color: MyColors.text.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
