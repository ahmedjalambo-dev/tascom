import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/routes/my_routes.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

/// The header widget for the home screen containing location and action icons.
class HomeHeader extends StatelessWidget {
  final String location;
  final String sublocation;
  final VoidCallback? onLocationTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onChatTap;

  const HomeHeader({
    super.key,
    this.location = 'Your Location',
    this.sublocation = 'Palestine, Nablus',
    this.onLocationTap,
    this.onNotificationTap,
    this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Row(
        children: [
          // Location section
          GestureDetector(
            onTap: onLocationTap,
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/app-bar/location.svg',
                  width: 24.sp,
                  height: 24.sp,
                  colorFilter: ColorFilter.mode(
                    MyColors.icons.icon,
                    BlendMode.srcIn,
                  ),
                ),
                HorizontalSpace(16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: MyTextStyle.label.label1.copyWith(
                        color: MyColors.text.secondary,
                      ),
                    ),
                    Text(
                      sublocation,
                      style: MyTextStyle.button.secondaryButton2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: MyColors.text.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),

          // Action icons
          GestureDetector(
            onTap: (){ Navigator.of(context).pushNamed(MyRoutes.notification);},
            child: SvgPicture.asset(
              'assets/icons/app-bar/notification.svg',
              width: 24.sp,
              height: 24.sp,
              colorFilter: ColorFilter.mode(
                MyColors.icons.icon,
                BlendMode.srcIn,
              ),
            ),
          ),
          HorizontalSpace(16.w),
          GestureDetector(
            onTap: onChatTap,
            child: SvgPicture.asset(
              'assets/icons/app-bar/message-multiple.svg',
              width: 24.sp,
              height: 24.sp,
              colorFilter: ColorFilter.mode(
                MyColors.icons.icon,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
