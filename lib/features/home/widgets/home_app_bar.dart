import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 48.h,
        left: 16.w,
        right: 16.w,
        bottom: 16.h,
      ),
      decoration: BoxDecoration(
        color: MyColors.background.secondary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          // Location section
          SvgPicture.asset(
            MyIcons.locationStroke,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Location',
                style: MyTextStyles.caption.captionNotes.copyWith(
                  color: MyColors.text.secondary,
                ),
              ),
              Text(
                'Palestine, Nablus',
                style: MyTextStyles.body.body1.copyWith(
                  color: MyColors.text.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Notification icon
          SvgPicture.asset(
            MyIcons.notificationStroke,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
          ),
          const HorizontalSpace(16),
          // Message icon
          SvgPicture.asset(
            MyIcons.messageStroke,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(MyColors.icons.icon, BlendMode.srcIn),
          ),
        ],
      ),
    );
  }
}
