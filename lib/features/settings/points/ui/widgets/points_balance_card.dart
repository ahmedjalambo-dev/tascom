import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';

class PointsBalanceCard extends StatelessWidget {
  final int balance;

  const PointsBalanceCard({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: MyColors.background.cardHover.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Points balance",
            style: MyTextStyle.body.body2.copyWith(
              color: MyColors.text.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg/zap.svg',
                width: 16.w,
                colorFilter: ColorFilter.mode(
                  MyColors.brand.purple,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "${balance.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} pts",
                style: MyTextStyle.heading.h22.copyWith(
                  color: MyColors.brand.purple,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
