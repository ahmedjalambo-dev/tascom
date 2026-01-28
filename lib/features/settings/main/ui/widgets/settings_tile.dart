import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class SettingsTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final bool showArrow;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.textColor,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 16.w,
      onTap: onTap,
      leading: icon,
      title: Text(
        title,
        style: MyTextStyle.body.body1.copyWith(
          color: textColor ?? MyColors.text.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: showArrow
          ? SvgPicture.asset(
              'assets/svg/arrow_forward_ios.svg',
              width: 16.w,
              height: 16.h,
              colorFilter: ColorFilter.mode(
                MyColors.text.primary,
                BlendMode.srcIn,
              ),
            )
          : null,
    );
  }
}
