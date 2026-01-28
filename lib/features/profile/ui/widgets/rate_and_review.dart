import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tascom/core/themes/my_colors.dart';
import 'package:tascom/core/themes/my_text_style.dart';
import 'package:tascom/core/widgets/spacing_widgets.dart';
import 'package:tascom/features/profile/data/profile_model.dart';

class RateAndReviews extends StatelessWidget {
  const RateAndReviews({super.key, required this.profile});

  final ProfileModel profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: MyColors.text.white,
        border: Border.all(color: MyColors.border.border, width: 1.w),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/star/solid.svg',
            width: 16.w,
            height: 16.h,
            colorFilter: ColorFilter.mode(MyColors.icons.star, BlendMode.srcIn),
          ),
          HorizontalSpace(4.w),
          Text(
            "${profile.rating} (${profile.reviewCount} reviews)",
            textAlign: TextAlign.center,
            style: MyTextStyle.label.label1.copyWith(
              color: MyColors.text.primary,
            ),
          ),
        ],
      ),
    );
  }
}
