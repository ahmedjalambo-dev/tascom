import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tascom/core/constants/my_icons.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_styles.dart';
import 'package:tascom/core/widgets/my_spacing.dart';

class PointsBalanceCard extends StatelessWidget {
  final int balance;

  const PointsBalanceCard({
    super.key,
    required this.balance,
  });

  String get _formattedBalance {
    if (balance >= 1000) {
      final thousands = balance ~/ 1000;
      final remainder = balance % 1000;
      return '$thousands,${remainder.toString().padLeft(3, '0')} pts';
    }
    return '$balance pts';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: MyColors.priority.low.bg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Points balance',
            style: MyTextStyles.body.body2.copyWith(
              color: MyColors.text.secondary,
            ),
          ),
          const VerticalSpace(8),
          Row(
            children: [
              SvgPicture.asset(
                MyIcons.pointsStroke,
                width: 24.w,
                height: 24.h,
                colorFilter: ColorFilter.mode(
                  MyColors.brand.purple,
                  BlendMode.srcIn,
                ),
              ),
              HorizontalSpace(8.w),
              Text(
                _formattedBalance,
                style: MyTextStyles.heading.h22.copyWith(
                  color: MyColors.brand.purple,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
