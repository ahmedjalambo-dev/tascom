import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/themes/my_colors.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.iconPath,
    required this.onTap,
    this.size = 56,
    this.iconSize = 24,
  });

  final String iconPath;
  final VoidCallback onTap;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        width: size.w,
        height: size.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: MyColors.border.border, width: 1),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: iconSize.w,
            height: iconSize.h,
          ),
        ),
      ),
    );
  }
}
