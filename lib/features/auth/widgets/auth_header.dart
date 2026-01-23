import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    this.logoPath = 'assets/images/tascom_logo.png',
    this.topSpacing = 24,
    this.logoTitleSpacing = 16,
    this.bottomSpacing = 24,
  });

  final String title;
  final String logoPath;
  final double topSpacing;
  final double logoTitleSpacing;
  final double bottomSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpace(topSpacing.h),
        Image.asset(
          logoPath,
          fit: BoxFit.contain,
          alignment: AlignmentGeometry.center,
        ),
        VerticalSpace(logoTitleSpacing.h),
        Text(
          title,
          style: MyTextStyle.heading.h21.copyWith(
            color: MyColors.text.primary,
          ),
        ),
        VerticalSpace(bottomSpacing.h),
      ],
    );
  }
}
